massplanner-agent


## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/massplanner/agent/main/install_script.sh | bash
```

If you selected option to activate virtualenv
```bash
python massplanner.py --resume /path/to/resume/location
```

Else (Assuming you have virtualenv activated with massplanner dependencies installed)
```bash
python massplanner-agent/massplanner.py --resume /path/to/resume/location
```