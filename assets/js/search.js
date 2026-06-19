/**
 * Client-side search functionality for Research notes
 * Uses FlexSearch for full-text indexing
 */
(function() {
    'use strict';

    // Search configuration
    const SEARCH_INDEX_URL = '/searchindex.html';
        // This should be a JSON file; I tried like hell to make it a JSON file.
        // But the JBake configuration is just not picking up the configuration
        // that's documentation to make it happen, and I'm tired to fighting it.
        // So, sure, parse JSON out of an .html-extension-named file. Why not.
    const DEBOUNCE_DELAY = 150;
    const MAX_RESULTS = 20;

    // State
    let searchIndex = null;
    let pageData = [];
    let searchInput = null;
    let searchResults = null;
    let debounceTimer = null;

    // Initialize search when DOM is ready
    document.addEventListener('DOMContentLoaded', init);

    function init() {
        searchInput = document.getElementById('search-input');
        searchResults = document.getElementById('search-results');

        if (!searchInput || !searchResults) {
            console.warn('Search elements not found');
            return;
        }

        // Load search index
        loadSearchIndex();

        // Add event listeners
        searchInput.addEventListener('input', handleSearchInput);
        searchInput.addEventListener('keydown', handleSearchKeydown);

        // Close results when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.search-container')) {
                hideResults();
            }
        });
    }

    async function loadSearchIndex() {
        try {
            const response = await fetch(SEARCH_INDEX_URL);
            if (!response.ok) {
                throw new Error('Failed to load search index');
            }
            pageData = await response.json();

            // Build FlexSearch index
            searchIndex = new FlexSearch.Document({
                document: {
                    id: 'uri',
                    index: ['title', 'summary', 'tags'],
                    store: ['title', 'uri', 'summary', 'tags', 'category', 'date']
                },
                tokenize: 'forward',
                cache: true
            });

            // Add documents to index
            pageData.forEach(page => {
                searchIndex.add(page);
            });

        } catch (error) {
            console.error('Error loading search index:', error);
            showError('Unable to load search index');
        }
    }

    function handleSearchInput(e) {
        const query = e.target.value.trim();

        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => {
            if (query.length < 2) {
                hideResults();
                return;
            }
            performSearch(query);
        }, DEBOUNCE_DELAY);
    }

    function handleSearchKeydown(e) {
        if (e.key === 'Escape') {
            hideResults();
            searchInput.blur();
        } else if (e.key === 'ArrowDown') {
            e.preventDefault();
            focusNextResult();
        } else if (e.key === 'ArrowUp') {
            e.preventDefault();
            focusPrevResult();
        } else if (e.key === 'Enter') {
            e.preventDefault();
            activateFocusedResult();
        }
    }

    function performSearch(query) {
        if (!searchIndex) {
            showError('Search index not loaded');
            return;
        }

        try {
            // Search across all fields
            const results = searchIndex.search(query, {
                limit: MAX_RESULTS,
                enrich: true
            });

            // Flatten and dedupe results
            const seen = new Set();
            const uniqueResults = [];

            results.forEach(fieldResult => {
                if (fieldResult.result) {
                    fieldResult.result.forEach(item => {
                        if (!seen.has(item.id)) {
                            seen.add(item.id);
                            uniqueResults.push(item.doc);
                        }
                    });
                }
            });

            displayResults(uniqueResults, query);
        } catch (error) {
            console.error('Search error:', error);
            showError('Search failed');
        }
    }

    function displayResults(results, query) {
        if (!searchResults) return;

        if (results.length === 0) {
            searchResults.innerHTML = `
                <div class="search-no-results">
                    No results found for "<strong>${escapeHtml(query)}</strong>"
                </div>
            `;
            searchResults.classList.add('show');
            return;
        }

        const html = results.map((page, index) => {
            const tags = page.tags ? page.tags.join(', ') : '';
            const highlightedTitle = highlightQuery(page.title, query);
            const highlightedSummary = highlightQuery(page.summary || '', query);

            return `
                <div class="search-result-item" data-index="${index}" tabindex="0">
                    <a href="${escapeHtml(page.uri)}" class="search-result-link">
                        <div class="search-result-title">${highlightedTitle}</div>
                        <div class="search-result-summary">${highlightedSummary}</div>
                        ${tags ? `<div class="search-result-tags">${escapeHtml(tags)}</div>` : ''}
                    </a>
                </div>
            `;
        }).join('');

        searchResults.innerHTML = html;
        searchResults.classList.add('show');

        // Add click handlers
        searchResults.querySelectorAll('.search-result-item').forEach(item => {
            item.addEventListener('click', function() {
                const link = this.querySelector('a');
                if (link) {
                    window.location.href = link.href;
                }
            });
        });
    }

    function highlightQuery(text, query) {
        if (!text) return '';
        const escapedQuery = escapeRegex(query);
        const regex = new RegExp(`(${escapedQuery})`, 'gi');
        return escapeHtml(text).replace(regex, '<mark>$1</mark>');
    }

    function escapeRegex(string) {
        return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    }

    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    function hideResults() {
        if (searchResults) {
            searchResults.classList.remove('show');
        }
    }

    function showError(message) {
        if (searchResults) {
            searchResults.innerHTML = `
                <div class="search-error">
                    ${escapeHtml(message)}
                </div>
            `;
            searchResults.classList.add('show');
        }
    }

    // Keyboard navigation
    let focusedIndex = -1;

    function focusNextResult() {
        const items = searchResults?.querySelectorAll('.search-result-item');
        if (!items || items.length === 0) return;

        if (focusedIndex < items.length - 1) {
            focusedIndex++;
        } else {
            focusedIndex = 0;
        }
        updateFocus(items);
    }

    function focusPrevResult() {
        const items = searchResults?.querySelectorAll('.search-result-item');
        if (!items || items.length === 0) return;

        if (focusedIndex > 0) {
            focusedIndex--;
        } else {
            focusedIndex = items.length - 1;
        }
        updateFocus(items);
    }

    function updateFocus(items) {
        items.forEach((item, index) => {
            item.classList.toggle('focused', index === focusedIndex);
        });
        if (items[focusedIndex]) {
            items[focusedIndex].focus();
        }
    }

    function activateFocusedResult() {
        const items = searchResults?.querySelectorAll('.search-result-item');
        if (!items || focusedIndex < 0 || focusedIndex >= items.length) return;

        const link = items[focusedIndex].querySelector('a');
        if (link) {
            window.location.href = link.href;
        }
    }

    // Reset focus when search input is cleared
    searchInput?.addEventListener('input', function() {
        if (this.value.length < 2) {
            focusedIndex = -1;
        }
    });

})();