local rs_41000 = {}

local _rules = {
	{
		id = 41001,
		action = "DENY",
		description = "SQL Comment Sequence",
		vars = {
			{
				operator = "REGEX",
				pattern = [=[(/\*!?|\*/|[';]--|--[\s\r\n\v\f]|(?:--[^-]*?-)|([^\-&])#.*?[\s\r\n\v\f]|;?\\x00)]=],
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41002,
		action = "DENY",
		description = "SQL Hex Encoding",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:\\A|[^\\d])0x[a-f\\d]{3,}[a-f\\d]*)+",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41003,
		action = "DENY",
		description = "SQL String Termination",
		vars = {
			{
				operator = "REGEX",
				pattern = "(^[\\\"'`´’‘;]+|[\\\"'`´’‘;]+$)",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41004,
		action = "DENY",
		description = "SQL Operators",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(\\!\\=|\\&\\&|\\|\\||>>|<<|>=|<=|<>|<=>|xor|rlike|regexp|isnull)|(?:not\\s+between\\s+0\\s+and)|(?:is\\s+null)|(like\\s+null)|(?:(?:^|\\W)in[+\\s]*\\([\\s\\d\\\"]+[^()]*\\))|(?:xor|<>|rlike(?:\\s+binary)?)|(?:regexp\\s+binary))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41005,
		action = "DENY",
		description = "SQL Tautologies",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:([\\s'\\\"`´’‘\\(\\)]*?)\\b([\\d\\w]++)([\\s'\\\"`´’‘\\(\\)]*?)(?:(?:=|<=>|r?like|sounds\\s+like|regexp)([\\s'\\\"`´’‘\\(\\)]*?)\\2\\b|(?:!=|<=|>=|<>|<|>|\\^|is\\s+not|not\\s+like|not\\s+regexp)([\\s'\\\"`´’‘\\(\\)]*?)(?!\\2)([\\d\\w]+)\\b))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41006,
		action = "DENY",
		description = "Common database name detected",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:m(?:s(?:ysaccessobjects|ysaces|ysobjects|ysqueries|ysrelationships|ysaccessstorage|ysaccessxml|ysmodules|ysmodules2|db)|aster\\.\\.sysdatabases|ysql\\.db)|s(?:ys(?:\\.database_name|aux)|chema(?:\\W*\\(|_name)|qlite(_temp)?_master)|d(?:atabas|b_nam)e\\W*\\(|information_schema|pg_(catalog|toast)|northwind|tempdb))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41007,
		action = "DENY",
		description = "Blind SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:\\b(?:(?:s(?:ys\\.(?:user_(?:(?:t(?:ab(?:_column|le)|rigger)|object|view)s|c(?:onstraints|atalog))|all_tables|tab)|elect\\b.{0,40}\\b(?:substring|users?|ascii))|m(?:sys(?:(?:queri|ac)e|relationship|column|object)s|ysql\\.(db|user))|c(?:onstraint_type|harindex)|waitfor\\b\\W*?\\bdelay|attnotnull)\\b|(?:locate|instr)\\W+\\()|\\@\\@spid\\b)|\\b(?:(?:s(?:ys(?:(?:(?:process|tabl)e|filegroup|object)s|c(?:o(?:nstraint|lumn)s|at)|dba|ibm)|ubstr(?:ing)?)|user_(?:(?:(?:constrain|objec)t|tab(?:_column|le)|ind_column|user)s|password|group)|a(?:tt(?:rel|typ)id|ll_objects)|object_(?:(?:nam|typ)e|id)|pg_(?:attribute|class)|column_(?:name|id)|xtype\\W+\\bchar|mb_users|rownum)\\b|t(?:able_name\\b|extpos\\W+\\()))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41008,
		action = "DENY",
		description = "SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:\\b(?:(?:s(?:t(?:d(?:dev(_pop|_samp)?)?|r(?:_to_date|cmp))|u(?:b(?:str(?:ing(_index)?)?|(?:dat|tim)e)|m)|e(?:c(?:_to_time|ond)|ssion_user)|ys(?:tem_user|date)|ha(1|2)?|oundex|chema|ig?n|pace|qrt)|i(?:s(null|_(free_lock|ipv4_compat|ipv4_mapped|ipv4|ipv6|not_null|not|null|used_lock))?|n(?:et6?_(aton|ntoa)|s(?:ert|tr)|terval)?|f(null)?)|u(?:n(?:compress(?:ed_length)?|ix_timestamp|hex)|tc_(date|time|timestamp)|p(?:datexml|per)|uid(_short)?|case|ser)|l(?:o(?:ca(?:l(timestamp)?|te)|g(2|10)?|ad_file|wer)|ast(_day|_insert_id)?|e(?:(?:as|f)t|ngth)|case|trim|pad|n)|t(?:ime(stamp|stampadd|stampdiff|diff|_format|_to_sec)?|o_(base64|days|seconds|n?char)|r(?:uncate|im)|an)|m(?:a(?:ke(?:_set|date)|ster_pos_wait|x)|i(?:(?:crosecon)?d|n(?:ute)?)|o(?:nth(name)?|d)|d5)|r(?:e(?:p(?:lace|eat)|lease_lock|verse)|o(?:w_count|und)|a(?:dians|nd)|ight|trim|pad)|f(?:i(?:eld(_in_set)?|nd_in_set)|rom_(base64|days|unixtime)|o(?:und_rows|rmat)|loor)|a(?:es_(?:de|en)crypt|s(?:cii(str)?|in)|dd(?:dat|tim)e|(?:co|b)s|tan2?|vg)|p(?:o(?:sition|w(er)?)|eriod_(add|diff)|rocedure_analyse|assword|i)|b(?:i(?:t_(?:length|count|x?or|and)|n(_to_num)?)|enchmark)|e(?:x(?:p(?:ort_set)?|tract(value)?)|nc(?:rypt|ode)|lt)|v(?:a(?:r(?:_(?:sam|po)p|iance)|lues)|ersion)|g(?:r(?:oup_conca|eates)t|et_(format|lock))|o(?:(?:ld_passwo)?rd|ct(et_length)?)|we(?:ek(day|ofyear)?|ight_string)|n(?:o(?:t_in|w)|ame_const|ullif)|(rawton?)?hex(toraw)?|qu(?:arter|ote)|(pg_)?sleep|year(week)?|d?count|xmltype|hour)\\W*\\(|\\b(?:(?:s(?:elect\\b(?:.{1,100}?\\b(?:(?:length|count|top)\\b.{1,100}?\\bfrom|from\\b.{1,100}?\\bwhere)|.*?\\b(?:d(?:ump\\b.*\\bfrom|ata_type)|(?:to_(?:numbe|cha)|inst)r))|p_(?:sqlexec|sp_replwritetovarbin|sp_help|addextendedproc|is_srvrolemember|prepare|sp_password|execute(?:sql)?|makewebtask|oacreate)|ql_(?:longvarchar|variant))|xp_(?:reg(?:re(?:movemultistring|ad)|delete(?:value|key)|enum(?:value|key)s|addmultistring|write)|terminate|xp_servicecontrol|xp_ntsec_enumdomains|xp_terminate_process|e(?:xecresultset|numdsn)|availablemedia|loginconfig|cmdshell|filelist|dirtree|makecab|ntsec)|u(?:nion\\b.{1,100}?\\bselect|tl_(?:file|http))|d(?:b(?:a_users|ms_java)|elete\\b\\W*?\\bfrom)|group\\b.*\\bby\\b.{1,100}?\\bhaving|open(?:rowset|owa_util|query)|load\\b\\W*?\\bdata\\b.*\\binfile|(?:n?varcha|tbcreato)r|autonomous_transaction)\\b|i(?:n(?:to\\b\\W*?\\b(?:dump|out)file|sert\\b\\W*?\\binto|ner\\b\\W*?\\bjoin)\\b|(?:f(?:\\b\\W*?\\(\\W*?\\bbenchmark|null\\b)|snull\\b)\\W*?\\()|print\\b\\W*?\\@\\@|cast\\b\\W*?\\()|c(?:(?:ur(?:rent_(?:time(?:stamp)?|date|user)|(?:dat|tim)e)|h(?:ar(?:(?:acter)?_length|set)?|r)|iel(?:ing)?|ast|r32)\\W*\\(|o(?:(?:n(?:v(?:ert(?:_tz)?)?|cat(?:_ws)?|nection_id)|(?:mpres)?s|ercibility|alesce|t)\\W*\\(|llation\\W*\\(a))|d(?:(?:a(?:t(?:e(?:(_(add|format|sub))?|diff)|abase)|y(name|ofmonth|ofweek|ofyear)?)|e(?:(?:s_(de|en)cryp|faul)t|grees|code)|ump)\\W*\\(|bms_\\w+\\.\\b)|(?:;\\W*?\\b(?:shutdown|drop)|\\@\\@version)\\b|\\butl_inaddr\\b|\\bsys_context\\b|'(?:s(?:qloledb|a)|msdasql|dbo)'))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41009,
		action = "DENY",
		description = "SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\b(?:having)\\b\\s+(\\d{1,10}|'[^=]{1,10}')\\s*?[=<>]|(?:\\bexecute(\\s{1,5}[\\w\\.$]{1,5}\\s{0,3})?\\()|\\bhaving\\b ?(?:\\d{1,10}|[\\'\\\"][^=]{1,10}[\\'\\\"]) ?[=<>]+|(?:\\bcreate\\s+?table.{0,20}?\\()|(?:\\blike\\W*?char\\W*?\\()|(?:(?:(select(.*?)case|from(.*?)limit|order\\sby)))|exists\\s(\\sselect|select\\Sif(null)?\\s\\(|select\\Stop|select\\Sconcat|system\\s\\(|\\b(?:having)\\b\\s+(\\d{1,10})|'[^=]{1,10}')",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41010,
		action = "DENY",
		description = "SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:\\bor\\b ?(?:\\d{1,10}|[\\'\\\"][^=]{1,10}[\\'\\\"]) ?[=<>]+|(?:'\\s+x?or\\s+.{1,20}[+\\-!<>=])|\\b(?:x?or)\\b\\s+(\\d{1,10}|'[^=]{1,10}')|\\b(?i:x?or)\\b\\s+(\\d{1,10}|'[^=]{1,10}')\\s*?[=<>])",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41011,
		action = "DENY",
		description = "SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "\\b(?:and)\\b\\s+(\\d{1,10}|'[^=]{1,10}')\\s*?[=]|\\b(?:and)\\b\\s+(\\d{1,10}|'[^=]{1,10}')\\s*?[<>]|\\band\\b ?(?:\\d{1,10}|[\\'\\\"][^=]{1,10}[\\'\\\"]) ?[=<>]+|\\b(?:and)\\b\\s+(\\d{1,10}|'[^=]{1,10}')",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41012,
		action = "DENY",
		description = "SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:\\b(?:coalesce\\b|root\\@))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = "41013",
		action = "DENY",
		description = "SQL Injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:(?:s(?:t(?:d(?:dev(_pop|_samp)?)?|r(?:_to_date|cmp))|u(?:b(?:str(?:ing(_index)?)?|(?:dat|tim)e)|m)|e(?:c(?:_to_time|ond)|ssion_user)|ys(?:tem_user|date)|ha(1|2)?|oundex|chema|ig?n|pace|qrt)|i(?:s(null|_(free_lock|ipv4_compat|ipv4_mapped|ipv4|ipv6|not_null|not|null|used_lock))?|n(?:et6?_(aton|ntoa)|s(?:ert|tr)|terval)?|f(null)?)|u(?:n(?:compress(?:ed_length)?|ix_timestamp|hex)|tc_(date|time|timestamp)|p(?:datexml|per)|uid(_short)?|case|ser)|l(?:o(?:ca(?:l(timestamp)?|te)|g(2|10)?|ad_file|wer)|ast(_day|_insert_id)?|e(?:(?:as|f)t|ngth)|case|trim|pad|n)|t(?:ime(stamp|stampadd|stampdiff|diff|_format|_to_sec)?|o_(base64|days|seconds|n?char)|r(?:uncate|im)|an)|m(?:a(?:ke(?:_set|date)|ster_pos_wait|x)|i(?:(?:crosecon)?d|n(?:ute)?)|o(?:nth(name)?|d)|d5)|r(?:e(?:p(?:lace|eat)|lease_lock|verse)|o(?:w_count|und)|a(?:dians|nd)|ight|trim|pad)|f(?:i(?:eld(_in_set)?|nd_in_set)|rom_(base64|days|unixtime)|o(?:und_rows|rmat)|loor)|a(?:es_(?:de|en)crypt|s(?:cii(str)?|in)|dd(?:dat|tim)e|(?:co|b)s|tan2?|vg)|p(?:o(?:sition|w(er)?)|eriod_(add|diff)|rocedure_analyse|assword|i)|b(?:i(?:t_(?:length|count|x?or|and)|n(_to_num)?)|enchmark)|e(?:x(?:p(?:ort_set)?|tract(value)?)|nc(?:rypt|ode)|lt)|v(?:a(?:r(?:_(?:sam|po)p|iance)|lues)|ersion)|g(?:r(?:oup_conca|eates)t|et_(format|lock))|o(?:(?:ld_passwo)?rd|ct(et_length)?)|we(?:ek(day|ofyear)?|ight_string)|n(?:o(?:t_in|w)|ame_const|ullif)|(rawton?)?hex(toraw)?|qu(?:arter|ote)|(pg_)?sleep|year(week)?|d?count|xmltype|hour)\\W*?\\(|\\b(?:(?:s(?:elect\\b(?:.{1,100}?\\b(?:(?:length|count|top)\\b.{1,100}?\\bfrom|from\\b.{1,100}?\\bwhere)|.*?\\b(?:d(?:ump\\b.*?\\bfrom|ata_type)|(?:to_(?:numbe|cha)|inst)r))|p_(?:sqlexec|sp_replwritetovarbin|sp_help|addextendedproc|is_srvrolemember|prepare|sp_password|execute(?:sql)?|makewebtask|oacreate)|ql_(?:longvarchar|variant))|xp_(?:reg(?:re(?:movemultistring|ad)|delete(?:value|key)|enum(?:value|key)s|addmultistring|write)|terminate|xp_servicecontrol|xp_ntsec_enumdomains|xp_terminate_process|e(?:xecresultset|numdsn)|availablemedia|loginconfig|cmdshell|filelist|dirtree|makecab|ntsec)|u(?:nion\\b.{1,100}?\\bselect|tl_(?:file|http))|d(?:b(?:a_users|ms_java)|elete\\b\\W*?\\bfrom)|group\\b.*?\\bby\\b.{1,100}?\\bhaving|open(?:rowset|owa_util|query)|load\\b\\W*?\\bdata\\b.*?\\binfile|(?:n?varcha|tbcreato)r|autonomous_transaction)\\b|i(?:n(?:to\\b\\W*?\\b(?:dump|out)file|sert\\b\\W*?\\binto|ner\\b\\W*?\\bjoin)\\b|(?:f(?:\\b\\W*?\\(\\W*?\\bbenchmark|null\\b)|snull\\b)\\W*?\\()|print\\b\\W*?\\@\\@|cast\\b\\W*?\\()|c(?:(?:ur(?:rent_(?:time(?:stamp)?|date|user)|(?:dat|tim)e)|h(?:ar(?:(?:acter)?_length|set)?|r)|iel(?:ing)?|ast|r32)\\W*?\\(|o(?:(?:n(?:v(?:ert(?:_tz)?)?|cat(?:_ws)?|nection_id)|(?:mpres)?s|ercibility|alesce|t)\\W*?\\(|llation\\W*?\\(a))|d(?:(?:a(?:t(?:e(?:(_(add|format|sub))?|diff)|abase)|y(name|ofmonth|ofweek|ofyear)?)|e(?:(?:s_(de|en)cryp|faul)t|grees|code)|ump)\\W*?\\(|bms_\\w+\\.\\b)|(?:;\\W*?\\b(?:shutdown|drop)|\\@\\@version)\\b|\\butl_inaddr\\b|\\bsys_context\\b|'(?:s(?:qloledb|a)|msdasql|dbo)'))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41014,
		action = "IGNORE",
		description = "SQL Injection character anomaly",
		vars = {
			{
				operator = "REGEX",
				pattern = "([\\~\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\-\\+\\=\\{\\}\\[\\]\\|\\:\\;\\\"\\'\\´\\’\\‘\\`\\<\\>].*?){13,}",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41015,
		action = "DENY",
		description = "SQL Benchmark Injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(sleep\\((\\s*?)(\\d*?)(\\s*?)\\)|benchmark\\((.*?)\\,(.*?)\\)))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41016,
		action = "DENY",
		description = "SQL Injection payload",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:\\d[\\\"'`´’‘]\\s+[\\\"'`´’‘]\\s+\\d)|(?:^admin\\s*?[\\\"'`´’‘]|(\\/\\*)+[\\\"'`´’‘]+\\s?(?:--|#|\\/\\*|{)?)|(?:[\\\"'`´’‘]\\s*?\\b(x?or|div|like|between|and)\\b\\s*?[+<>=(),-]\\s*?[\\d\\\"'`´’‘])|(?:[\\\"'`´’‘]\\s*?[^\\w\\s]?=\\s*?[\\\"'`´’‘])|(?:[\\\"'`´’‘]\\W*?[+=]+\\W*?[\\\"'`´’‘])|(?:[\\\"'`´’‘]\\s*?[!=|][\\d\\s!=+-]+.*?[\\\"'`´’‘(].*?$)|(?:[\\\"'`´’‘]\\s*?[!=|][\\d\\s!=]+.*?\\d+$)|(?:[\\\"'`´’‘]\\s*?like\\W+[\\w\\\"'`´’‘(])|(?:\\sis\\s*?0\\W)|(?:where\\s[\\s\\w\\.,-]+\\s=)|(?:[\\\"'`´’‘][<>~]+[\\\"'`´’‘]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41017,
		action = "DENY",
		description = "MSSQL code injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:\\sexec\\s+xp_cmdshell)|(?:[\\\"'`´’‘]\\s*?!\\s*?[\\\"'`´’‘\\w])|(?:from\\W+information_schema\\W)|(?:(?:(?:current_)?user|database|schema|connection_id)\\s*?\\([^\\)]*?)|(?:[\\\"'`´’‘];?\\s*?(?:select|union|having)\\s*?[^\\s])|(?:\\wiif\\s*?\\()|(?:exec\\s+master\\.)|(?:union select @)|(?:union[\\w(\\s]*?select)|(?:select.*?\\w?user\\()|(?:into[\\s+]+(?:dump|out)file\\s*?[\\\"'`´’‘]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41018,
		action = "DENY",
		description = "MySQL comment-/space-obfuscated injections and backtick termination",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:,.*?[)\\da-f\\\"'`´’‘][\\\"'`´’‘](?:[\\\"'`´’‘].*?[\\\"'`´’‘]|\\Z|[^\\\"'`´’‘]+))|(?:\\Wselect.+\\W*?from)|((?:select|create|rename|truncate|load|alter|delete|update|insert|desc)\\s*?\\(\\s*?space\\s*?\\())",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41019,
		action = "DENY",
		description = "Chained SQL injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:@.+=\\s*?\\(\\s*?select)|(?:\\d+\\s*?(x?or|div|like|between|and)\\s*?\\d+\\s*?[\\-+])|(?:\\/\\w+;?\\s+(?:having|and|x?or|div|like|between|and|select)\\W)|(?:\\d\\s+group\\s+by.+\\()|(?:(?:;|#|--)\\s*?(?:drop|alter))|(?:(?:;|#|--)\\s*?(?:update|insert)\\s*?\\w{2,})|(?:[^\\w]SET\\s*?@\\w+)|(?:(?:n?and|x?x?or|div|like|between|and|not |\\|\\||\\&\\&)[\\s(]+\\w+[\\s)]*?[!=+]+[\\s\\d]*?[\\\"'`´’‘=()]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41020,
		action = "DENY",
		description = "SQL integer overflow",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:^(-0000023456|4294967295|4294967296|2147483648|2147483647|0000012345|-2147483648|-2147483649|0000023456|2.2.90738585072007e-308|1e309)$))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41021,
		action = "DENY",
		description = "SQL sleep and benchmark queries",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:(select|;)\\s+(?:benchmark|if|sleep)\\s*?\\(\\s*?\\(?\\s*?\\w+))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41022,
		action = "DENY",
		description = "Conditional SQL injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:[\\s()]case\\s*?\\()|(?:\\)\\s*?like\\s*?\\()|(?:having\\s*?[^\\s]+\\s*?[^\\w\\s])|(?:if\\s?\\([\\d\\w]\\s*?[=<>~]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41023,
		action = "DENY",
		description = "MySQL charset switch attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:alter\\s*?\\w+.*?character\\s+set\\s+\\w+)|([\\\"'`´’‘];\\s*?waitfor\\s+time\\s+[\\\"'`´’‘])|(?:[\\\"'`´’‘];.*?:\\s*?goto))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41024,
		action = "DENY",
		description = "SQL MERGE, EXECUTE, IMMEDIATE, HAVING injections",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:merge.*?using\\s*?\\()|(execute\\s*?immediate\\s*?[\\\"'`´’‘])|(?:\\W+\\d*?\\s*?having\\s*?[^\\s\\-])|(?:match\\s*?[\\w(),+-]+\\s*?against\\s*?\\())",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41025,
		action = "DENY",
		description = "SQL injection (authentication bypass)",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:union\\s*?(?:all|distinct|[(!@]*?)?\\s*?[([]*?\\s*?select\\s+)|(?:\\w+\\s+like\\s+[\\\"'`´’‘])|(?:like\\s*?[\\\"'`´’‘]\\%)|(?:[\\\"'`´’‘]\\s*?like\\W*?[\\\"'`´’‘\\d])|(?:[\\\"'`´’‘]\\s*?(?:n?and|x?x?or|div|like|between|and|not |\\|\\||\\&\\&)\\s+[\\s\\w]+=\\s*?\\w+\\s*?having\\s+)|(?:[\\\"'`´’‘]\\s*?\\*\\s*?\\w+\\W+[\\\"'`´’‘])|(?:[\\\"'`´’‘]\\s*?[^?\\w\\s=.,;)(]+\\s*?[(@\\\"'`´’‘]*?\\s*?\\w+\\W+\\w)|(?:select\\s+?[\\[\\]()\\s\\w\\.,\\\"'`´’‘-]+from\\s+)|(?:find_in_set\\s*?\\())",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41026,
		action = "DENY",
		description = "Common MySQL and Oracle SQL injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:(union(.*?)select(.*?)from)))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41027,
		action = "DENY",
		description = "Posgres pg_sleep injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:select\\s*?pg_sleep)|(?:waitfor\\s*?delay\\s?[\\\"'`´’‘]+\\s?\\d)|(?:;\\s*?shutdown\\s*?(?:;|--|#|\\/\\*|{)))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41028,
		action = "DENY",
		description = "MongoDB SQL injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:\\[\\$(?:ne|eq|lte?|gte?|n?in|mod|all|size|exists|type|slice|x?or|div|like|between|and)\\]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41029,
		action = "DENY",
		description = "MySQL comment and char injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:\\)\\s*?when\\s*?\\d+\\s*?then)|(?:[\\\"'`´’‘]\\s*?(?:#|--|{))|(?:\\/\\*!\\s?\\d+)|(?:ch(?:a)?r\\s*?\\(\\s*?\\d)|(?:(?:(n?and|x?x?or|div|like|between|and|not)\\s+|\\|\\||\\&\\&)\\s*?\\w+\\())",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41030,
		action = "DENY",
		description = "Chained SQL injection attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:[\\\"'`´’‘]\\s+and\\s*?=\\W)|(?:\\(\\s*?select\\s*?\\w+\\s*?\\()|(?:\\*\\/from)|(?:\\+\\s*?\\d+\\s*?\\+\\s*?@)|(?:\\w[\\\"'`´’‘]\\s*?(?:[-+=|@]+\\s*?)+[\\d(])|(?:coalesce\\s*?\\(|@@\\w+\\s*?[^\\w\\s])|(?:\\W!+[\\\"'`´’‘]\\w)|(?:[\\\"'`´’‘];\\s*?(?:if|while|begin))|(?:[\\\"'`´’‘][\\s\\d]+=\\s*?\\d)|(?:order\\s+by\\s+if\\w*?\\s*?\\()|(?:[\\s(]+case\\d*?\\W.+[tw]hen[\\s(]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41031,
		action = "DENY",
		description = "MySQL stored procedure function injection",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:procedure\\s+analyse\\s*?\\()|(?:;\\s*?(declare|open)\\s+[\\w-]+)|(?:create\\s+(procedure|function)\\s*?\\w+\\s*?\\(\\s*?\\)\\s*?-)|(?:declare[^\\w]+[@#]\\s*?\\w+)|(exec\\s*?\\(\\s*?@))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41032,
		action = "DENY",
		description = "SQL probing attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:[\\\"'`´’‘]\\s*?(x?or|div|like|between|and)\\s*?[\\\"'`´’‘]?\\d)|(?:\\\\\\\\x(?:23|27|3d))|(?:^.?[\\\"'`´’‘]$)|(?:(?:^[\\\"'`´’‘\\\\\\\\]*?(?:[\\d\\\"'`´’‘]+|[^\\\"'`´’‘]+[\\\"'`´’‘]))+\\s*?(?:n?and|x?x?or|div|like|between|and|not|\\|\\||\\&\\&)\\s*?[\\w\\\"'`´’‘][+&!@(),.-])|(?:[^\\w\\s]\\w+\\s*?[|-]\\s*?[\\\"'`´’‘]\\s*?\\w)|(?:@\\w+\\s+(and|x?or|div|like|between|and)\\s*?[\\\"'`´’‘\\d]+)|(?:@[\\w-]+\\s(and|x?or|div|like|between|and)\\s*?[^\\w\\s])|(?:[^\\w\\s:]\\s*?\\d\\W+[^\\w\\s]\\s*?[\\\"'`´’‘].)|(?:\\Winformation_schema|table_name\\W))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41033,
		action = "DENY",
		description = " SQL injection (authentication bypass)",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:in\\s*?\\(+\\s*?select)|(?:(?:n?and|x?x?or|div|like|between|and|not |\\|\\||\\&\\&)\\s+[\\s\\w+]+(?:regexp\\s*?\\(|sounds\\s+like\\s*?[\\\"'`´’‘]|[=\\d]+x))|([\\\"'`´’‘]\\s*?\\d\\s*?(?:--|#))|(?:[\\\"'`´’‘][\\%&<>^=]+\\d\\s*?(=|x?or|div|like|between|and))|(?:[\\\"'`´’‘]\\W+[\\w+-]+\\s*?=\\s*?\\d\\W+[\\\"'`´’‘])|(?:[\\\"'`´’‘]\\s*?is\\s*?\\d.+[\\\"'`´’‘]?\\w)|(?:[\\\"'`´’‘]\\|?[\\w-]{3,}[^\\w\\s.,]+[\\\"'`´’‘])|(?:[\\\"'`´’‘]\\s*?is\\s*?[\\d.]+\\s*?\\W.*?[\\\"'`´’‘]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41034,
		action = "DENY",
		description = "MySQL UDF injection/data structure manipulation",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:create\\s+function\\s+\\w+\\s+returns)|(?:;\\s*?(?:select|create|rename|truncate|load|alter|delete|update|insert|desc)\\s*?[\\[(]?\\w{2,}))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41035,
		action = "DENY",
		description = "Concatenated SQL injection / SQLLFI",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:[\\d\\W]\\s+as\\s*?[\\\"'`´’‘\\w]+\\s*?from)|(?:^[\\W\\d]+\\s*?(?:union|select|create|rename|truncate|load|alter|delete|update|insert|desc))|(?:(?:select|create|rename|truncate|load|alter|delete|update|insert|desc)\\s+(?:(?:group_)concat|char|load_file)\\s?\\(?)|(?:end\\s*?\\);)|([\\\"'`´’‘]\\s+regexp\\W)|(?:[\\s(]load_file\\s*?\\())",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
	{
		id = 41036,
		action = "DENY",
		description = "SQL probing attempt",
		vars = {
			{
				operator = "REGEX",
				pattern = "(?:(?:[\\\"'`´’‘]\\s*?\\*.+(?:x?or|div|like|between|and|id)\\W*?[\\\"'`´’‘]\\d)|(?:\\^[\\\"'`´’‘])|(?:^[\\w\\s\\\"'`´’‘-]+(?<=and\\s)(?<=or|xor|div|like|between|and\\s)(?<=xor\\s)(?<=nand\\s)(?<=not\\s)(?<=\\|\\|)(?<=\\&\\&)\\w+\\()|(?:[\\\"'`´’‘][\\s\\d]*?[^\\w\\s]+\\W*?\\d\\W*?.*?[\\\"'`´’‘\\d])|(?:[\\\"'`´’‘]\\s*?[^\\w\\s?]+\\s*?[^\\w\\s]+\\s*?[\\\"'`´’‘])|(?:[\\\"'`´’‘]\\s*?[^\\w\\s]+\\s*?[\\W\\d].*?(?:#|--))|(?:[\\\"'`´’‘].*?\\*\\s*?\\d)|(?:[\\\"'`´’‘]\\s*?(x?or|div|like|between|and)\\s[^\\d]+[\\w-]+.*?\\d)|(?:[()\\*<>%+-][\\w-]+[^\\w\\s]+[\\\"'`´’‘][^,]))",
				type = "REQUEST_ARGS",
				opts = {
					{ all = true }
				},
			},
		},
	},
}

function rs_41000.rules()
	return _rules
end

return rs_41000
