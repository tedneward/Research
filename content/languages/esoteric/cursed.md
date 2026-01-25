title=Cursed
tags=language, esoteric
summary=The only compiled language that lets you code with "sus", "slay", and "vibez" while achieving near-c performance.
~~~~~~

[Website](https://cursed-lang.org/) | [Source](https://github.com/ghuntley/cursed) | Documentation: [Language Specifications](https://github.com/ghuntley/cursed/specs/) | [Grammar Reference](https://github.com/ghuntley/cursed/specs/grammar.md) | [Type System](https://github.com/ghuntley/cursed/specs/types.md) | [Concurrency Model](https://github.com/ghuntley/cursed/specs/concurrency.md) | [Memory Management](https://github.com/ghuntley/cursed/specs/memory_management.md) | [Error Handling](https://github.com/ghuntley/cursed/specs/error_handling.md)

> An esoteric programming language that combines Go-like semantics with Gen Z slang keywords, featuring the world's first use of Among Us `ඞ` characters in pointer syntax.

CURSED is a statically typed, garbage-collected programming language designed to make coding more expressive and culturally relevant while maintaining practical functionality. It's self-hosting through a multi-stage bootstrap compiler written in Zig.

## Features

- **Gen Z Slang Keywords**: Core programming constructs use contemporary slang (`slay` for function, `sus` for variable, `vibe` for package, `stan` for goroutine)
- **Among Us Pointer Syntax**: First programming language to use `ඞ` (U+0D9E) for pointer operations
- **Go-like Semantics**: Familiar control flow and typing for experienced developers
- **Built-in Concurrency**: Goroutines (`stan`) and channels (`dm`) for concurrent programming
- **Advanced Memory Management**: Generational garbage collector with performance monitoring
- **Comprehensive Error Handling**: `yikes`/`fam`/`shook` error system with panic recovery

## Quick Start

### Hello World

```cursed
vibe main
yeet "vibez"

slay main() {
    vibez.spill("Hello, World!")
}
```

### Variables and Types

```cursed
vibe example
yeet "vibez", "stringz"

slay demo() {
    sus age normie = 25          // 32-bit integer
    sus name tea = "Alice"       // string
    sus is_cool lit = based      // boolean (true)
    sus height snack = 5.8       // 32-bit float
    
    // Pointer operations with Among Us syntax
    sus ptr ඞnormie = ඞage       // pointer to age
    sus value normie = *ptr      // dereference
    
    vibez.spill("Name:", name)
}
```

### Functions and Control Flow

```cursed
slay calculate(x normie, y normie) normie {
    ready x > y {
        damn x + y
    } otherwise {
        damn x - y
    }
}

slay loop_example() {
    bestie i := 0; i < 10; i++ {
        ready i % 2 == 0 {
            vibez.spill("Even:", i)
        }
    }
}
```

### Concurrency

```cursed
slay worker_example() {
    sus ch dm<normie>           // channel
    
    // Spawn goroutine
    stan {
        dm_send(ch, 42)
    }
    
    // Receive from channel
    result := dm_recv(ch)
    vibez.spill("Received:", result)
}
```

### Error Handling

```cursed
slay divide(a normie, b normie) normie yikes {
    ready b == 0 {
        yikes "Division by zero"
    }
    damn a / b
}

slay safe_division() {
    fam {
        result := divide(10, 0) shook
        vibez.spill("Result:", result)
    } sus error {
        vibez.spill("Error:", error.message())
    }
}
```

## Language Overview

### Keywords Mapping

| Traditional | CURSED | Usage |
|-------------|--------|-------|
| package | `vibe` | Package declaration |
| import | `yeet` | Import packages |
| func | `slay` | Function definition |
| var | `sus` | Variable declaration |
| const | `facts` | Constant declaration |
| if | `ready` | Conditional |
| else | `otherwise` | Alternative branch |
| for | `bestie` | Loop |
| while | `periodt` | While loop |
| return | `damn` | Return statement |
| true | `based` | Boolean true |
| false | `cringe` | Boolean false |
| nil | `nah` | Null value |
| go | `stan` | Spawn goroutine |

### Types

| Type | Description |
|------|-------------|
| `lit` | Boolean |
| `normie` | 32-bit signed integer |
| `smol` | 8-bit signed integer |
| `mid` | 16-bit signed integer |
| `thicc` | 64-bit signed integer |
| `snack` | 32-bit float |
| `meal` | 64-bit float |
| `tea` | String |
| `sip` | Character |
| `ඞT` | Pointer to type T |
| `dm<T>` | Channel of type T |

## Installation

### Prerequisites

- Zig 0.13+ (compiler implementation)
- Git

The CURSED compiler is now implemented in Zig with built-in LLVM support, eliminating external LLVM dependencies and enabling cross-platform compilation including Windows.

### Building from Source

```bash
git clone https://github.com/ghuntley/cursed
cd cursed
zig build
```

### Running Programs

```bash
# Interpret and run a CURSED program
./zig-out/bin/cursed-compiler example.💀

# Compile to native executable
./zig-out/bin/cursed-compiler --compile example.💀

# Generate LLVM IR
./zig-out/bin/cursed-compiler --emit-ir example.💀

# Debug mode
./zig-out/bin/cursed-compiler --debug --verbose example.💀
```

## Project Structure

```
├── src-zig/            # Zig compiler implementation source
├── runtime/            # Runtime library and garbage collector  
├── stdlib/             # Standard library modules
├── specs/              # Language specifications
├── test_suite/         # Comprehensive tests (including LeetCode suite)
├── tools/              # Development tools
└── build.zig           # Zig build configuration
```

## Development Status

CURSED has evolved through multiple implementation phases:

1. ✅ **Stage 0**: Environment setup and language design
2. ✅ **Stage 1**: Zig-native compiler with LLVM backend  
3. 🚧 **Stage 2**: Advanced features and optimization
4. 🔮 **Stage 3**: Self-hosting compiler in CURSED

**Current Status**: Full compiler implemented in Zig with comprehensive language support, built-in LLVM backend, and extensive test suite including 17+ LeetCode problems.

## Examples

### LeetCode Test Suite

The [`test_suite/leetcode_comprehensive_suite/`](test_suite/leetcode_comprehensive_suite/) contains **17+ LeetCode problems** implemented in CURSED, demonstrating:

- **Complex algorithms**: Binary search, dynamic programming, backtracking
- **Data structures**: Linked lists and trees with `ඞ` pointers  
- **String manipulation**: Anagram detection, palindrome validation
- **Array operations**: Two Sum, 3Sum, Product Except Self
- **Meme implementations**: FizzBuzz with "Sus" and "Impostor"

```cursed
// LeetCode #206: Reverse Linked List with Among Us pointers
slay reverse_list(head ඞListNode) ඞListNode {
    sus prev ඞListNode = nah
    sus current ඞListNode = head
    
    periodt current != nah {
        sus next_temp ඞListNode = current.next
        current.next = prev
        prev = current
        current = next_temp
    }
    
    damn prev
}
```

🌳 binary tree reversal

        squad TreeNode {
            val normie
            left ඞTreeNode
            right ඞTreeNode
        }

        slay invert_tree(root ඞTreeNode) ඞTreeNode {
            ready (root == nah) {
                damn nah
            }
            
            fr fr Swap the children
            root.left, root.right = root.right, root.left
            
            fr fr Recursively invert subtrees
            invert_tree(root.left)
            invert_tree(root.right)
            
            damn root
        }
                    
🎯 two sum (leetcode #1)

        yeet "arrayz"

        slay two_sum(nums []normie, target normie) []normie {
            sus seen = new_hashmap<normie, normie>()
            
            bestie (i, num in nums) {
                sus complement = target - num
                
                ready (seen.has(complement)) {
                    damn [seen.get(complement), i]
                }
                
                seen.set(num, i)
            }
            
            damn [] fr fr not found
        }

        fr fr Usage: two_sum([2,7,11,15], 9) -> [0,1]
                    
🔗 reverse linked list (leetcode #206)

        squad ListNode {
            val normie
            next ඞListNode
        }

        slay reverse_list(head ඞListNode) ඞListNode {
            sus prev ඞListNode = nah
            sus current = head
            
            bestie (current != nah) {
                sus next = current.next
                current.next = prev
                prev = current
                current = next
            }
            
            damn prev fr fr new head
        }
                    
🧩 longest substring (leetcode #3)

        yeet "stringz"

        slay longest_substring(s tea) normie {
            sus char_map = new_hashmap<tea, normie>()
            sus left normie = 0
            sus max_len normie = 0
            
            bestie (right, char in s) {
                ready (char_map.has(char) && 
                        char_map.get(char) >= left) {
                    left = char_map.get(char) + 1
                }
                
                char_map.set(char, right)
                max_len = max(max_len, right - left + 1)
            }
            
            damn max_len
        }
                    
🧠 regular expression (leetcode #10 - hard)

        slay is_match(s tea, p tea) lit {
            sus m = s.len()
            sus n = p.len()
            sus dp = make_matrix<lit>(m+1, n+1)
            
            dp[0][0] = based
            
            fr fr Handle patterns like a*, a*b*, a*b*c*
            bestie (i in 0..n) {
                ready (p[i] == '*') {
                    dp[0][i+1] = dp[0][i-1]
                }
            }
            
            bestie (i in 0..m) {
                bestie (j in 0..n) {
                    ready (p[j] == '*') {
                        dp[i+1][j+1] = dp[i+1][j-1]
                        ready (p[j-1] == s[i] || p[j-1] == '.') {
                            dp[i+1][j+1] ||= dp[i][j+1]
                        }
                    } otherwise {
                        ready (p[j] == s[i] || p[j] == '.') {
                            dp[i+1][j+1] = dp[i][j]
                        }
                    }
                }
            }
            
            damn dp[m][n]
        }
                    
💧 trapping rain water (leetcode #42 - hard)

        slay trap(height []normie) normie {
            ready (height.len() < 3) {
                damn 0
            }
            
            sus left = 0
            sus right = height.len() - 1
            sus left_max = 0
            sus right_max = 0
            sus water = 0
            
            bestie (left < right) {
                ready (height[left] < height[right]) {
                    ready (height[left] >= left_max) {
                        left_max = height[left]
                    } otherwise {
                        water += left_max - height[left]
                    }
                    left++
                } otherwise {
                    ready (height[right] >= right_max) {
                        right_max = height[right]
                    } otherwise {
                        water += right_max - height[right]
                    }
                    right--
                }
            }
            
            damn water fr fr total trapped water
        }
                    
🪟 min window substring (leetcode #76 - hard)

        yeet "stringz"

        slay min_window(s tea, t tea) tea {
            sus target_count = new_hashmap<tea, normie>()
            bestie (char in t) {
                target_count[char] = target_count.get(char) + 1
            }
            
            sus required = target_count.size()
            sus formed = 0
            sus window_counts = new_hashmap<tea, normie>()
            
            sus left = 0, right = 0
            sus min_len = normie.max
            sus min_left = 0, min_right = 0
            
            bestie (right < s.len()) {
                sus char = s[right]
                window_counts[char] = window_counts.get(char) + 1
                
                ready (target_count.has(char) && 
                        window_counts[char] == target_count[char]) {
                    formed++
                }
                
                bestie (left <= right && formed == required) {
                    ready (right - left + 1 < min_len) {
                        min_len = right - left + 1
                        min_left = left
                        min_right = right
                    }
                    
                    sus char = s[left]
                    window_counts[char]--
                    ready (target_count.has(char) && 
                            window_counts[char] < target_count[char]) {
                        formed--
                    }
                    left++
                }
                right++
            }
            
            damn min_len == normie.max ? "" : s[min_left..min_right+1]
        }
                    
🚀 sliding window max (leetcode #239 - hard)

        yeet "arrayz"

        slay max_sliding_window(nums []normie, k normie) []normie {
            sus result = []
            sus deque = new_deque<normie>()
            
            bestie (i in 0..nums.len()) {
                fr fr Remove elements outside window
                bestie (!deque.empty() && deque.front() <= i - k) {
                    deque.pop_front()
                }
                
                fr fr Remove smaller elements from back
                bestie (!deque.empty() && 
                        nums[deque.back()] <= nums[i]) {
                    deque.pop_back()
                }
                
                deque.push_back(i)
                
                fr fr Add to result when window is full
                ready (i >= k - 1) {
                    result.push(nums[deque.front()])
                }
            }
            
            damn result
        }


