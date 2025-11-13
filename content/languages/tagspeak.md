title=Tagspeak
tags=language
summary=A symbolic, packet‑based language designed to be human‑readable and machine‑parsable.
~~~~~~

[Source](https://github.com/mordraga/tagspeak_rs)

# TagSpeak 101

### Audience

This file is a quick reference for **Codex-style agents** and humans who need to read or write TagSpeak (`.tgsk`) programs.

---

## What is TagSpeak?

TagSpeak is a **dataflow-oriented DSL**. Instead of mutating state with imperative statements, values move left → right through chained **packets**. Each packet has the shape `[packet@arg]` and transforms the value it receives.

Data is always carried forward by the `>` connector:

```tgsk
[msg@"hi"]>[store@greeting]>[print]
```

1. `[msg]` produces "hi".

2. `[store]` saves it under `greeting`.

3. `[print]` outputs it.

---

## Core Concepts

1. **Everything is a packet** – packets transform, store, or route data.

2. **Inline sugar vs. canonical packets** – friendly forms (`>` or `==`) have explicit equivalents (`[pipe]`, `[eq]`). Prefer canonical packets when clarity matters.

3. **Structured file operations** – when emitting files, prefer `[log(json|yaml|toml)@path]{...}` over ad‑hoc writes.

---

## Packet Reference (Canonical)

These tables consolidate every packet implemented under `src/packets/*`. Each row links a TagSpeak primitive with a familiar operation in other ecosystems so humans can triangulate behaviour quickly.

### src/packets/core

| **Concept** | **TagSpeak** | **Python** | **JavaScript** | **Bash** | **Rust** |
|----|----|----|----|----|----|
| Inline comment | `[note@"Reminder"]` | `# Reminder` | `// Reminder` | `# Reminder` | `// Reminder` |
| String literal | `[msg@"Hello"]` | `"Hello"` | `"Hello"` | `printf 'Hello'` | `"Hello".to_string()` |
| Integer literal | `[int@42]` | `42` | `42` | `42` | `42` |
| Boolean literal | `[bool@true]` | `True` | `true` | `true` | `true` |
| Math expression | `[math@x+1]` | `x + 1` | `x + 1` | `$((x + 1))` | `x + 1` |
| Store value (fluid/rigid/context) | `[store@x] / [store:fluid@x] / [store:rigid@x] / [store:context(x>0)@tone]` | `x = value` | `let x = value;` | `x=$value` | `let mut x = value;` |
| Read variable | `[var@x]` | `x` | `x` | `$x` | `x` |
| Print value | `[print@value]` | `print(value)` | `console.log(value)` | `echo "$value"` | `println!("{}", value);` |
| Pretty dump | `[dump]` | `pprint.pprint(value)` | `console.dir(value, {depth: null})` | `jq '.' <<<"$value"` | `serde_json::to_string_pretty(&value)?` |
| Input line | `[input@"Name? "]` | `input("Name? ")` | `await prompt("Name? ")` | `read -p "Name? " name` | `std::io::stdin().read_line(&mut name)?;` |
| Length of last value | `[len] / [len@value]` | `len(value)` | `value.length` | `${#value}` | `value.len()` |
| Random number | `[rand] / [rand(1,10)]` | `random.random()` | `Math.random()` | `$RANDOM` | `rand::random::<f64>()` |
| Environment variable | `[env@HOME]` | `os.getenv("HOME")` | `process.env.HOME` | `$HOME` | `std::env::var("HOME")` |
| Change directory | `[cd@/data]` | `os.chdir("data")` | `process.chdir("data")` | `cd data` | `std::env::set_current_dir("data")?` |
| Help lookup | `[help@packet]` | `help(packet)` | `console.log(docs.packet)` | `man packet` | `cargo doc --open` |
| Lint TagSpeak | `[lint@/script.tgsk]` | `ruff script.py` | `eslint script.js` | `shellcheck script.sh` | `cargo clippy` |
| Array document literal | `[array@[1,2,3]]` | `[1, 2, 3]` | `[1, 2, 3]` | `arr=(1 2 3)` | `vec![1, 2, 3]` |
| Object document literal | `[obj]{[key(name)@"Ana"]}` | `{ "name": "Ana" }` | `({ name: "Ana" })` | `jq -n '{name:"Ana"}'` | `serde_json::json!({"name": "Ana"})` |
| Parse structured text | `[parse(json)@"{\"a\":1}"]` | `json.loads(src)` | `JSON.parse(src)` | `jq '.' <<<"$src"` | `serde_json::from_str(src)?` |
| Reflect runtime | `[reflect(packets)]` | `dir(runtime)` | `Object.keys(runtime)` | `n/a` | `runtime.list_packets()?` |
| Equality compare | `[eq@rhs]` | `left == rhs` | `left === rhs` | `[ "$left" = "$rhs" ]` | `left == rhs` |
| Inequality compare | `[ne@rhs]` | `left != rhs` | `left !== rhs` | `[ "$left" != "$rhs" ]` | `left != rhs` |
| Less-than compare | `[lt@rhs]` | `left < rhs` | `left < rhs` | `[ "$left" -lt "$rhs" ]` | `left < rhs` |
| Less-or-equal compare | `[le@rhs]` | `left <= rhs` | `left <= rhs` | `[ "$left" -le "$rhs" ]` | `left <= rhs` |
| Greater-than compare | `[gt@rhs]` | `left > rhs` | `left > rhs` | `[ "$left" -gt "$rhs" ]` | `left > rhs` |
| Greater-or-equal compare | `[ge@rhs]` | `left >= rhs` | `left >= rhs` | `[ "$left" -ge "$rhs" ]` | `left >= rhs` |

### src/packets/files

| **Concept** | **TagSpeak** | **Python** | **JavaScript** | **Bash** | **Rust** |
|--------|----|----|----|----|----|
| Load document | `[load@/data.json]` | `json.load(open("data.json"))` | `JSON.parse(fs.readFileSync("data.json","utf8"))` | `jq '.' data.json` | `serde_json::from_reader(std::fs::File::open("data.json")?)?` |
| Save runtime snapshot | `[save@/state.json]` | `json.dump(state, open("state.json","w"), indent=2)` | `fs.writeFileSync("state.json", JSON.stringify(state, null, 2))` | `printf '%s\n' "$STATE" > state.json` | `std::fs::write("state.json", data)?` |
| Log last value | `[log@/out.json] / [log(yaml)@/out.yaml] / [log(toml)@/out.toml]` | `json.dump(value, open("out.json","w"), indent=2)` | `fs.writeFileSync("out.json", JSON.stringify(value, null, 2))` | `printf '%s\n' "$value" > out.json` | `serde_json::to_writer_pretty(std::fs::File::create("out.json")?, &value)?` |
| Structured log entries | `[log(json)@profile.json]{[key(name)@"Saryn"][sect@address]{[key(city)@"SF"]}}` | `{ "name": "Saryn", "address": { "city": "SF" } }` | `const profile = { name: "Saryn", address: { city: "SF" } };` | `jq -n '{name:"Saryn",address:{city:"SF"}}'` | `serde_json::json!({"name":"Saryn","address":{"city":"SF"}})` |
| Set path (overwrite/missing) | `[mod@doc]{[set(user.name)@"Jen"]} / [mod@doc]{[set(user.name, missing)@"Jen"]}` | `doc["user"]["name"] = "Jen"` | `doc.user ??= {}; doc.user.name = "Jen";` | `jq '.user.name="Jen"' doc.json` | `doc["user"]["name"] = serde_json::json!("Jen");` |
| Compare-and-set path | `[mod@doc]{[comp(user.name)@"Jen"]} / [mod(overwrite)@doc]{[comp(user.name)@"Jen"]} / [mod@doc]{[comp!(user.name)@"Jen"]}` | `doc.setdefault("user", {}).setdefault("name", "Jen")` | `doc.user ??= {}; doc.user.name ??= "Jen";` | `jq '(.user //= {}) | (.user.name //= "Jen")' doc.json` | `doc["user"].as_object_mut()?.entry("name".into()).or_insert(serde_json::json!("Jen"));` |
| Merge object | `[mod@doc]{[merge(user)@{"role":"admin"}]}` | `doc["user"].update({"role": "admin"})` | `Object.assign(doc.user, { role: "admin" });` | `jq '.user += {"role":"admin"}' doc.json` | `if let Some(user) = doc["user"].as_object_mut() { user.extend(serde_json::json!({"role":"admin"}).as_object().unwrap().clone()); }` |
| Insert path once | `[mod@doc]{[ins(user.id)@42]} / [mod@doc]{[insert(user.id)@42]}` | `user = doc.setdefault("user", {}); if "id" not in user: user["id"] = 42` | `const user = (doc.user ??= {}); if (!("id" in user)) user.id = 42;` | `jq '(.user //= {}) | (if (.user|has("id")) then . else .user.id=42 end)' doc.json` | `if let Some(user) = doc["user"].as_object_mut() { if !user.contains_key("id") { user.insert("id".into(), serde_json::json!(42)); } }` |
| Append to list | `[mod@doc]{[push(items)@4]} / [mod@doc]{[append(items)@4]}` | `doc["items"].append(4)` | `doc.items.push(4);` | `jq '.items += [4]' doc.json` | `doc["items"].as_array_mut()?.push(serde_json::json!(4));` |
| Delete path | `[mod@doc]{[del(user.id)]} / [mod@doc]{[remove(user.id)]} / [mod@doc]{[delete(user.id)]}` | `del doc["user"]["id"]` | `delete doc.user.id;` | `jq 'del(.user.id)' doc.json` | `doc["user"].as_object_mut()?.remove("id");` |
| Read path | `[get(user.name)@doc]` | `doc["user"]["name"]` | `doc.user.name` | `jq -r '.user.name' doc.json` | `doc["user"]["name"].clone()` |
| Check path exists | `[exists(user.name)@doc]` | `'name' in doc.get("user", {})` | `'name' in (doc.user ?? {})` | `[ "$(jq '.user|has(\"name\")' doc.json)" = true ]` | `doc["user"].as_object().map_or(false, |m| m.contains_key("name"))` |
| Search resource | `[search(/chem.json)@"chem.sodium.atomic_number"] / [search(/script.tgsk)@"[chem:sodium]"]` | `json.load(open("chem.json"))["chem"]["sodium"]["atomic_number"]` | `JSON.parse(fs.readFileSync("chem.json","utf8")).chem.sodium.atomic_number` | `jq '.chem.sodium.atomic_number' chem.json` | `serde_json::from_reader(std::fs::File::open("chem.json")?)?["chem"]["sodium"]["atomic_number"].clone()` |

### src/packets/flow

| **Concept** | **TagSpeak** | **Python** | **JavaScript** | **Bash** | **Rust** |
|--------|--------|--------|--------|--------|--------|
| Define function | `[funct:reply]{[print@"hi"]}` | `def reply(): print("hi")` | `function reply(){ console.log("hi"); }` | `reply(){ echo hi; }` | `fn reply() { println!("hi"); }` |
| Call function | `[call@reply]` | `reply()` | `reply();` | `reply` | `reply();` |
| Dataflow conditional | `[if(x==y)]>[then]{...}` | `if x == y:` | `if (x === y) {}` | `if [ "$x" -eq "$y" ]; then` | `if x == y {}` |
| Then block routing | `[then]{...}` | `# body indented` | `{ /* body */ }` | `then ... fi` | `{ /* body */ }` |
| Else-if branch | `[or(z>y)]>[then]{...}` | `elif z > y:` | `else if (z > y) {}` | `elif [ "$z" -gt "$y" ]; then` | `else if z > y {}` |
| Else fallback | `[else]>[then]{...}` | `else:` | `else {}` | `else` | `else {}` |
| Fixed-count loop | `[loop@5]{...} / [loop5@tag] / [loop:tag@5]` | `for _ in range(5):` | `for (let i = 0; i < 5; i++) {}` | `for i in {1..5}; do ...; done` | `for _ in 0..5 {}` |
| Iterate document array | `[iter@items]{...}` | `for idx, item in enumerate(items):` | `items.forEach((item, idx) => {})` | `for idx in "${!items[@]}"; do item=${items[$idx]}; ...; done` | `for (idx, item) in items.iter().enumerate() {}` |

### src/packets/execs

| **Concept** | **TagSpeak** | **Python** | **JavaScript** | **Bash** | **Rust** |
|--------|--------|--------|--------|------|------|
| Prompt for consent | `[yellow@"Proceed?"]{[exec@"ls"]} / [confirm@"Proceed?"]{...} / [yellow:exec@"ls"]` | `input("Proceed? ")` | `await prompt("Proceed? ")` | `read -p "Proceed? " choice` | `dialoguer::Confirm::new().with_prompt("Proceed?").interact()?` |
| Shell command (stdout/stderr/code/json) | `[exec@"ls"] / [exec(stderr)@"ls"] / [exec(code)@"ls"] / [exec(json)@"ls"]` | `subprocess.run(["ls"], capture_output=True)` | `child_process.execSync("ls", {stdio: "pipe"})` | `ls` | `Command::new("ls").output()?` |
| Run TagSpeak script | `[run@/flows/demo.tgsk] / [tagspeak run@/flows/demo.tgsk] / [tagspeak build@/flows/demo.tgsk]` | `subprocess.run(["tagspeak","run","flows/demo.tgsk"])` | `child_process.spawnSync("tagspeak", ["run","flows/demo.tgsk"])` | `tagspeak run flows/demo.tgsk` | `Command::new("tagspeak").args(["run","flows/demo.tgsk"]).status()?` |
| Session consent gate | `[red@"Need consent"]` | `n/a` | `n/a` | `n/a` | `n/a` |
| HTTP request | `[http(get)@https://example.com]{[key(header.Accept)@"application/json"]}` | `requests.get("https://example.com")` | `fetch("https://example.com")` | `curl https://example.com` | `reqwest::get("https://example.com").await?` |
| Interactive REPL | `[repl(model)]{...}` | `code.interact(local=locals())` | `node` | `python -i` | `evcxr` |

### src/packets/ui

| **Concept** | **TagSpeak** | **Python** | **JavaScript** | **Bash** | **Rust** |
|-------------|--------------|------------|----------------|----------|----------|
| Application root window | `[app@"Title"]{...}` | `root = tkinter.Tk()` | `const app = document.getElementById("root");` | `n/a` | `eframe::run_native("Title", options, app)` |
| Legacy window container | `[ui:window@"Title"]{...}` | `tkinter.Toplevel(root)` | `const win = window.open("", "Title")` | `n/a` | `egui::Window::new("Title").show(ctx, |_| {})` |
| Alert dialog | `[ui:alert@"Heads up"]` | `tkinter.messagebox.showinfo("TagSpeak","Heads up")` | `alert("Heads up")` | `whiptail --msgbox "Heads up" 8 40` | `rfd::MessageDialog::new().set_title("TagSpeak").set_description("Heads up").show()` |
| Choice menu | `[ui:select@"red\|blue\|green]` | `questionary.select("Pick", ["red","green","blue"]).ask()` | `await prompts({ type: "select", choices: ["red","green","blue"] })` | `select opt in red green blue; do ...; done` | `dialoguer::Select::new().items(&["red","green","blue"]).interact()?` |
| Region frame | `[frame:sidebar@"Nav"]{...}` | `ttk.Frame(root, name="sidebar")` | `const section = document.createElement("section")` | `n/a` | `egui::Frame::default().show(ui, \|_\| {})` |
| Layout modifiers | `[layout(direction=horizontal, spacing=12)@sidebar] / [layout(direction=vertical)]{...}` | `frame.pack(side="left")` | `sidebar.style.display = "flex"` | `n/a` | `ui.horizontal(\|ui\| { ... });` |
| Static label | `[label@"Hello"]` | `ttk.Label(root, text="Hello")` | `document.createTextNode("Hello")` | `echo "Hello"` | `ui.label("Hello");` |
| Button action | `[button@"Go"]{[call@doit]}` | `ttk.Button(root, text="Go", command=doit)` | `const btn = document.createElement("button"); btn.onclick = doit;` | `whiptail --yesno "Go?" 8 40` | `if ui.button("Go").clicked() { doit(); }` |
| Text input | `[textbox@name] / [textedit@name]` | `tkinter.Entry(root, textvariable=name_var)` | `const input = document.createElement("input"); input.name = "name";` | `read name` | `ui.text_edit_singleline(name);` |
| Checkbox | `[checkbox:flag@"Agree"]` | `ttk.Checkbutton(root, text="Agree", variable=flag)` | `const cb = document.createElement("input"); cb.type = "checkbox";` | `whiptail --checklist "Agree?" 8 40 1 "Agree" "" OFF` | `ui.checkbox("Agree", flag);` |
| Popup overlay | `[popup@"Details"]{...}` | `tkinter.Toplevel(root)` | `const dialog = document.createElement("dialog")` | `zenity --info --text="Details"` | `egui::Window::new("Details").show(ctx, \|_\| {})` |
| Separator | `[separator]` | `ttk.Separator(root, orient="horizontal")` | `document.createElement("hr")` | `printf '-----\n'` | `ui.separator();` |
| Spacer | `[spacer@16]` | `ttk.Frame(root, height=16).pack()` | `const spacer = document.createElement("div"); spacer.style.height = "16px";` | `printf '\n'` | `ui.add_space(16.0);` |
| Scope capture | `[scope@"main"]{...}` | `scope_var = contextvars.ContextVar("scope"); scope_var.set("main")` | `const scope = new Map(); scope.set("scope","main");` | `n/a` | `ui.push_id("main", \|ui\| { ... });`

---

## Examples

### Quick Dump

- Script: ../examples/logging/quick_log.tgsk
- Output: ../examples/logging/logging_outputs/quicklog.json

### JSON Structured Log

- Script: ../examples/logging/structured_log_json.tgsk
- Output: ../examples/logging/logging_outputs/struct_json.json

### YAML Structured Log

- Script: ../examples/logging/structured_log_yaml.tgsk
- Output: ../examples/logging/logging_outputs/struct_yaml.yaml

### TOML Structured Log

- Script: ../examples/logging/structured_log_toml.tgsk
- Output: ../examples/logging/logging_outputs/struct_toml.toml

## CLI Commands

- `tagspeak run <file.tgsk>` — execute a script from the shell (same as double-clicking or calling the binary directly).
- `tagspeak build <file.tgsk>` — syntax-check a script without running it; prints `build_ok /relative/path` on success.
- `tagspeak help [packet]` — print inline documentation for a packet (or list the available topics when omitted).
- `tagspeak lint <file.tgsk>` — run the `[lint]` heuristics against a script inside the current red box.

### CLI Sugar Wrapper

```tgsk
[tagspeak run@/basics/data/literals.tgsk]
```

Runs another script using CLI-style sugar. For a syntax check without execution:

```tgsk
[tagspeak build@/basics/data/literals.tgsk]
```

Returns `/basics/data/literals.tgsk` on success.

---

## Design Principles

* **Human-friendly** but machine-precise.
* **Composable** — packets can nest and chain.
* **Extensible** — future packets may add arrays, merges, or other structures.

