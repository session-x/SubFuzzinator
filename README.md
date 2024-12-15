
```markdown
# SubFuzzinator 🚀

SubFuzzinator is a powerful and recursive subdomain fuzzing tool designed to uncover deeply hidden subdomains and filter live domains effortlessly. Created with love by **Alvin**, this tool is perfect for security researchers, bug bounty hunters, and penetration testers.

---

## 🌟 Features
- **Recursive Subdomain Fuzzing**: Automatically fuzz multi-level subdomains using a customizable wordlist.
- **Live Subdomain Filtering**: Integrates with `httpx` to find live subdomains with ease.
- **Extensible and Lightweight**: Easily modify the script to suit your needs.

---

## 🛠️ Installation

### Prerequisites
1. Install **SubFuzzinator** dependencies:
   - [subfinder](https://github.com/projectdiscovery/subfinder)
   - [httpx](https://github.com/projectdiscovery/httpx)

   Install them via `go`:
   ```bash
   go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
   go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
   ```

2. Download the fuzzing wordlist (or use your own):
   - Example wordlist: [SecLists](https://github.com/danielmiessler/SecLists/blob/master/Discovery/DNS/subdomains-top1million-5000.txt).

---

### 🔧 Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/session-x/SubFuzzinator.git
   cd SubFuzzinator
   ```

2. Make the script executable:
   ```bash
   chmod +x subfuzzinator.sh
   ```

3. Run the tool:
   ```bash
   ./subfuzzinator.sh
   ```

4. Provide the input domain when prompted, and let the tool do the magic! 🎩✨

---

## 📂 Output

- **subdomains.txt**: Initial subdomains discovered by `subfinder`.
- **fuzzed_subdomains.txt**: Generated subdomains using recursive fuzzing.
- **live_subdomains.txt**: Live subdomains filtered using `httpx`.

---

## 🚀 Example

```bash
$ ./subfuzzinator.sh

Enter the domain to scan (e.g., google.com): example.com
Running subfinder on example.com...
Starting fuzzing process...
Running httpx to find live subdomains...
Found live subdomains:
- admin.example.com
- dev.api.example.com
- test.backend.example.com
```

---

## 🧠 How It Works

1. **Subdomain Discovery**: Uses `subfinder` to identify initial subdomains of the target domain.
2. **Fuzzing**: Generates new subdomains by combining discovered subdomains with a fuzzing wordlist.
3. **Recursive Scanning**: Applies the same fuzzing logic recursively to each new subdomain.
4. **Live Subdomain Detection**: Filters the generated subdomains to find live hosts using `httpx`.

---

## 📜 License

This project is licensed under the MIT License. Feel free to use, modify, and distribute it as you see fit.

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

---

## 🌟 Acknowledgements

- [SubFinder](https://github.com/projectdiscovery/subfinder) for subdomain enumeration.
- [HTTPX](https://github.com/projectdiscovery/httpx) for live subdomain filtering.
- [SecLists](https://github.com/danielmiessler/SecLists) for wordlists.

---

## 🔗 Connect with the Creator
- **linkdin**: [@alvin](https://www.linkedin.com/in/alvinbijo/)


---
```

---

