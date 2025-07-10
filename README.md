# robotframework-python-sample

This repository contains sample projects demonstrating how to use **Robot Framework** with different libraries in Python.

Each folder is organized by the specific Robot Framework library used, making it easier to learn and experiment based on your testing needs.

![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Automation-brightgreen)
![Python](https://img.shields.io/badge/Python-3.8+-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

---

## 📁 Folder Structure

### 🔹 `browserLibrary/`

Contains sample test cases using the `robotframework-browser` library, which is built on top of **Playwright**.

* Modern browser automation using Playwright
* Recommended for testing modern web applications
* Uses `Browser` library

📦 Install:

```bash
pip install robotframework-browser
rfbrowser init
```

> Note:
>
> * `rfbrowser init` will download the Playwright browser binaries.
> * **Node.js is required** to run Playwright. You can download it from [https://nodejs.org](https://nodejs.org).

---

### 🔹 `seleniumLibrary/`

Contains sample test cases using the `robotframework-seleniumlibrary`, the classic and widely used library for web automation.

* Based on **Selenium WebDriver**
* Compatible with most browsers (Chrome, Firefox, Edge)
* Good for legacy or stable UI automation

📦 Install:

```bash
pip install robotframework-seleniumlibrary
```

---

### 🔹 `requestLibrary/`

Contains sample test cases for **API testing** using the `robotframework-requests` library.

* Ideal for testing RESTful APIs
* Provides simple keyword-based interface for making HTTP requests and validating responses

📦 Install:

```bash
pip install robotframework-requests
```

---

### 🔹 `appiumLibrary/` (coming soon)

Planned folder for mobile app automation using the `robotframework-appiumlibrary`.

* Based on Appium server
* Supports Android and iOS automation
* Useful for testing hybrid and native mobile apps

📦 Will require:

```bash
pip install robotframework-appiumlibrary
```

Stay tuned for updates!

---

## 🚀 How to Run Tests

1. Clone this repository:

```bash
git clone https://github.com/your-username/robotframework-python-sample.git
cd robotframework-python-sample
```

2. (Optional but recommended) Create and activate a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install Robot Framework and the required libraries:

```bash
pip install -r requirements.txt
```

4. Navigate to any folder and run:

```bash
robot tests/
```

> Each folder may have different `tests/` locations or demo files.

---

## 📌 Requirements

* Python 3.8+
* Node.js (for browserLibrary)
* Robot Framework
* Libraries:

  * `robotframework`
  * `robotframework-browser`
  * `robotframework-seleniumlibrary`
  * `robotframework-requests`
  * *(soon)* `robotframework-appiumlibrary`

You can install all dependencies at once using the included `requirements.txt`.

---

## 🎨 Sample Output

After running a test suite, you will get three main output files:

* `log.html` — detailed step-by-step execution log
* `report.html` — summary of test results
* `output.xml` — raw execution data (used for integrations like Jenkins)

---

## 🤝 Contributions

Feel free to fork and contribute new examples, improvements, or support for other Robot Framework libraries! If you have a cool sample test, feel free to submit a pull request.

---

## 📄 License

This project is open-source and available under the MIT License.

---

Happy Testing! ✨
