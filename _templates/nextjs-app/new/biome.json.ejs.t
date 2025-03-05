---
to: <%= projectName %>/biome.json
---
{
	"$schema": "./node_modules/@biomejs/biome/configuration_schema.json",
	"vcs": {
		"enabled": false,
		"clientKind": "git",
		"useIgnoreFile": false
	},
	"files": {
		"ignoreUnknown": false,
		"ignore": [
			"node_modules/**",
			"cdk.out/**",
			".next/**",
			"dist/**",
			"bin/**/*.js",
			"bin/**/*.d.ts",
			"lib/**/*.js",
			"lib/**/*.d.ts"
		]
	},
	"formatter": {
		"enabled": true,
		"formatWithErrors": false,
		"indentStyle": "tab",
		"indentWidth": 2,
		"lineEnding": "lf",
		"lineWidth": 80
	},
	"javascript": {
		"formatter": {
			"enabled": true,
			"jsxQuoteStyle": "double",
			"quoteProperties": "asNeeded",
			"semicolons": "asNeeded",
			"arrowParentheses": "always",
			"bracketSameLine": false,
			"quoteStyle": "double",
			"bracketSpacing": true
		},
		"globals": []
	},
	"json": {
		"formatter": {
			"enabled": true
		}
	},
	"css": {
		"formatter": {
			"enabled": true
		}
	},
	"organizeImports": {
		"enabled": true
	},
	"linter": {
		"enabled": true,
		"rules": {
			"recommended": false,
			"complexity": {
				"noExtraBooleanCast": "error",
				"noMultipleSpacesInRegularExpressionLiterals": "error",
				"noUselessCatch": "error",
				"noUselessThisAlias": "error",
				"noUselessTypeConstraint": "error",
				"noWith": "error",
				"useLiteralKeys": "error",
				"useOptionalChain": "error"
			},
			"correctness": {
				"noConstAssign": "error",
				"noConstantCondition": "error",
				"noEmptyCharacterClassInRegex": "error",
				"noEmptyPattern": "error",
				"noGlobalObjectCalls": "error",
				"noInvalidConstructorSuper": "error",
				"noNonoctalDecimalEscape": "error",
				"noPrecisionLoss": "error",
				"noSelfAssign": "error",
				"noSetterReturn": "error",
				"noSwitchDeclarations": "error",
				"noUndeclaredVariables": "error",
				"noUnreachable": "error",
				"noUnreachableSuper": "error"
			},
			"style": {
				"noArguments": "error",
				"noVar": "error",
				"useConst": "error"
			},
			"suspicious": {
				"noDuplicateClassMembers": "off",
				"noDuplicateObjectKeys": "off",
				"noDuplicateParameters": "off"
			}
		}
	}
} 