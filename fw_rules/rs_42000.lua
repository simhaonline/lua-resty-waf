local rs_42000 = {}

local _rules = {
	{
		id = 42001,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bgetparentfolder\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42002,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonmousedown\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42003,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bsrc\\b\\W*?\\bshell:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42004,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bmocha:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42005,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonabort\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42006,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\blowsrc\\b\\W*?\\bhttp:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42007,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonmouseup\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42008,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bstyle\\b\\W*\\=.*bexpression\\b\\W*\\(",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42009,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bhref\\b\\W*?\\bshell:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42010,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bcreatetextrange\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42011,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bondragdrop\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42012,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bcopyparentfolder\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42013,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonunload\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42014,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\.execscript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42015,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bgetspecialfolder\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42016,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "<body\\b.*?\\bonload\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42017,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\burl\\b\\W*?\\bvbscript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42018,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonkeydown\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42019,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonmousemove\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42020,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\blivescript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42021,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonblur\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42022,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonmove\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42023,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bsettimeout\\b\\W*?\\(",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42024,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "< ?iframe",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42025,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bsrc\\b\\W*?\\bjavascript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42026,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "<body\\b.*?\\bbackground\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42027,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bsrc\\b\\W*?\\bvbscript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42028,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\becmascript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42029,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonfocus\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42030,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bdocument\\b\\s*\\.\\s*\\bcookie\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42031,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\<\\!\\[cdata\\[",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42032,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonerror\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42033,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\blowsrc\\b\\W*?\\bjavascript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42034,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bactivexobject\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42035,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonkeypress\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42036,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonsubmit\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42037,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\btype\\b\\W*?\\bapplication\\b\\W*?\\bx-javascript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42038,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\.addimport\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42039,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bhref\\b\\W*?\\bjavascript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42040,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonchange\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42042,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\bjscript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42042,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\balert\\b\\W*?\\(",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42043,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\btype\\b\\W*?\\bapplication\\b\\W*?\\bx-vbscript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42044,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "< ?meta",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42045,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bsrc\\b\\W*?\\bhttp:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42046,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\bvbscript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42047,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonmouseout\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42048,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\blowsrc\\b\\W*?\\bshell:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42049,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\basfunction:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42050,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonmouseover\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42051,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bhref\\b\\W*?\\bvbscript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42052,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\burl\\b\\W*?\\bjavascript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42053,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\.innerhtml\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42054,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonselect\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42055,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\import\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42056,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\blowsrc\\b\\W*?\\bvbscript:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42057,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonload\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42058,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "< ?script\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42059,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonresize\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42060,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonclick\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42061,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\biframe\\b.{0,100}?\\bsrc\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42062,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bbackground-image:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42063,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bonkeyup\\b\\W*?\\=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42064,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "<input\\b.*?\\btype\\b\\W*?\\bimage\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42065,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\burl\\b\\W*?\\bshell:",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42066,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\btype\\b\\W*?\\btext\\b\\W*?\\bjavascript\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42067,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\.fromcharcode\\b",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42068,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - HTML Tag Handler",
		vars = {
			{
				operator = "REGEX",
				pattern = "<(a|abbr|acronym|address|applet|area|audioscope|b|base|basefront|bdo|bgsound|big|blackface|blink|blockquote|body|bq|br|button|caption|center|cite|code|col|colgroup|comment|dd|del|dfn|dir|div|dl|dt|em|embed|fieldset|fn|font|form|frame|frameset|h1|head|hr|html|i|iframe|ilayer|img|input|ins|isindex|kdb|keygen|label|layer|legend|li|limittext|link|listing|map|marquee|menu|meta|multicol|nobr|noembed|noframes|noscript|nosmartquotes|object|ol|optgroup|option|p|param|plaintext|pre|q|rt|ruby|s|samp|script|select|server|shadow|sidebar|small|spacer|span|strike|strong|style|sub|sup|table|tbody|td|textarea|tfoot|th|thead|title|tr|tt|u|ul|var|wbr|xml|xmp)\\W",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42069,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\ballowscriptaccess\\b|\\brel\\b\\W*?=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42070,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = ".+application/x-shockwave-flash|image/svg\\+xml|text/(css|html|ecmascript|javascript|vbscript|x-(javascript|scriptlet|vbscript)).+",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42071,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bon(abort|blur|change|click|dblclick|dragdrop|error|focus|keydown|keypress|keyup|load|mousedown|mousemove|mouseout|mouseover|mouseup|move|readystatechange|reset|resize|select|submit|unload)\\b\\W*?=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42072,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\b(background|dynsrc|href|lowsrc|src)\\b\\W*?=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42073,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "(asfunction|javascript|vbscript|data|mocha|livescript):",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42074,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - Style Tag Manipulation",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\bstyle\\b\\W*?=",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42075,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - JS Fragments",
		vars = {
			{
				operator = "REGEX",
				pattern = "(fromcharcode|alert|eval)\\s*\\(",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42076,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - CSS Fragments",
		vars = {
			{
				operator = "REGEX",
				pattern = "background\\b\\W*?:\\W*?url|background-image\\b\\W*?:|behavior\\b\\W*?:\\W*?url|-moz-binding\\b|@import\\b|expression\\b\\W*?\\(",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42077,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "<!\\[cdata\\[|\\]\\]>",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42078,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - xss testing alert",
		vars = {
			{
				operator = "REGEX",
				pattern = "[/'\\\"<]xss[/'\\\">]",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42079,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - ASCII alert",
		vars = {
			{
				operator = "REGEX",
				pattern = "(88,83,83)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42080,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - xss testing alert",
		vars = {
			{
				operator = "REGEX",
				pattern = "'';!--\\\"<xss>=&{()}",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42081,
		action = "DENY",
		description = "XSS (Cross-Site Scripting)",
		vars = {
			{
				operator = "REGEX",
				pattern = "\"<!(doctype|entity)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42082,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<script.*?>)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42083,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<style.*?>.*?((@[i\\\\\\\\])|(([:=]|(&#x?0*((58)|(3A)|(61)|(3D));?)).*?([(\\\\\\\\]|(&#x?0*((40)|(28)|(92)|(5C));?)))))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42084,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = [=[(?:<script.*?[ /+\t]*?((src)|(xlink:href)|(href))[ /+\t]*=)]=],
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42085,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = [=[(?:<[i]?frame.*?[ /+\t]*?src[ /+\t]*=)]=],
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42086,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = [=[(?i:<.*[:]vmlframe.*?[ /+\t]*?src[ /+\t]*=)]=],
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42087,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(j|(&#x?0*((74)|(4A)|(106)|(6A));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(a|(&#x?0*((65)|(42)|(97)|(61));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(v|(&#x?0*((86)|(56)|(118)|(76));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(a|(&#x?0*((65)|(42)|(97)|(61));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(s|(&#x?0*((83)|(53)|(115)|(73));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(c|(&#x?0*((67)|(43)|(99)|(63));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(r|(&#x?0*((82)|(52)|(114)|(72));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(i|(&#x?0*((73)|(49)|(105)|(69));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(p|(&#x?0*((80)|(50)|(112)|(70));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(t|(&#x?0*((84)|(54)|(116)|(74));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(:|(&((#x?0*((58)|(3A));?)|(colon;)))).)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42088,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(v|(&#x?0*((86)|(56)|(118)|(76));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(b|(&#x?0*((66)|(42)|(98)|(62));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(s|(&#x?0*((83)|(53)|(115)|(73));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(c|(&#x?0*((67)|(43)|(99)|(63));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(r|(&#x?0*((82)|(52)|(114)|(72));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(i|(&#x?0*((73)|(49)|(105)|(69));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(p|(&#x?0*((80)|(50)|(112)|(70));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(t|(&#x?0*((84)|(54)|(116)|(74));?))([\\t]|(&((#x?0*(9|(13)|(10)|A|D);?)|(tab;)|(newline;))))*(:|(&((#x?0*((58)|(3A));?)|(colon;)))).)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42089,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<EMBED /+\\t].*?((src)|(type)).*?=)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42090,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<[?]?import /+\\t].*?implementation[ /+\\t]*=)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42091,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<META /+\\t].*?http-equiv[ /+\\t]*=[ /+\\t]*[\\\"\\'`]?(((c|(&#x?0*((67)|(43)|(99)|(63));?)))|((r|(&#x?0*((82)|(52)|(114)|(72));?)))|((s|(&#x?0*((83)|(53)|(115)|(73));?)))))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42092,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<META /+\\t].*?charset[ /+\\t]*=)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42093,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<LINK /+\\t].*?href[ /+\\t]*=)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42094,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<BASE /+\\t].*?href[ /+\\t]*=)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42095,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<APPLET /+\\t>])",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 42096,
		action = "DENY",
		description = "XSS (Cross-Site Scripting) - IE Filter",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:<OBJECT /+\\t].*?((type)|(codetype)|(classid)|(code)|(data))[ /+\\t]*=)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
}

function rs_42000.rules()
	return _rules
end

return rs_42000
