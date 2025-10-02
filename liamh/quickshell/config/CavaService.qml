pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

	property int barCount: 4
  property var values: Array(barCount).fill(0)
  // property var values: Array(barCount).fill(0).map(i => Math.random())

  property var config: ({
	"general": {
	  "bars": barCount,
	  "framerate": 30,
	  "autosens": 1,
	  "sensitivity": 100,
	  "lower_cutoff_freq": 50,
	  "higher_cutoff_freq": 12000
	},
	"smoothing": {
	  "monstercat": 0,
	  "noise_reduction": 40
	},
	"output": {
	  "method": "raw",
	  "data_format": "ascii",
	  "ascii_max_range": 100,
	  "bit_format": "8bit",
	  "channels": "mono",
	  "mono_option": "average"
	}
  })

  Process {
	id: process
	
	stdinEnabled: true

	running: true

	command: ["cava", "-p", "/dev/stdin"]

	onExited: {
	  stdinEnabled = true

	  values = Array(4).fill(0)

	  console.log('Exited')
	}
	
	onStarted: {
	  for (const k in config) {
		if (typeof config[k] !== "object") {
		  write(k + "=" + config[k] + "\n")
		  continue
		}

		write("[" + k + "]\n")

		const obj = config[k]

		for (const k2 in obj) {
		  write(k2 + "=" + obj[k2] + "\n")
		}
	  }

	  stdinEnabled = false

	  values = Array(4).fill(0)
	}

	stdout: SplitParser {
	  onRead: data => {
		root.values = data.slice(0, -1).split(";").map(v => parseInt(v, 10) / 100)
	  }
	}
  }
}