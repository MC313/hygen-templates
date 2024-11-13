---
to: <%= projectName %>/.vscode/settings.json
---
{
	"editor.codeActionsOnSave": {
		"source.organizeImports.biome": "explicit",
		"quickfix.biome": "explicit"
	},
	"editor.formatOnSave": true,
	"[javascript]": {
		"editor.defaultFormatter": "biomejs.biome"
	},
	"[typescript]": {
		"editor.defaultFormatter": "biomejs.biome"
	},
	"[typescriptreact]": {
		"editor.defaultFormatter": "biomejs.biome"
	},
	"[json]": {
		"editor.defaultFormatter": "biomejs.biome"
	}
}
