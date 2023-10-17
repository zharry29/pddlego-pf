from fix_json import fix_json

json = """{
  "objects": {
    "add": ["driveway - location"],
    "replace": {
      "driveway - location": "driveway - location"
    },
    "delete": []
  },
  "init": {
    "add": [(visited driveway)", "(connected driveway backyard north)"],
    "replace": {
      "(at backyard)": "(at driveway)",
      "(connected backyard driveway south)": "(connected backyard driveway south)"
    },
    "delete": []
  }
}"""

print(fix_json(json))