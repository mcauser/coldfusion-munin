<cfsetting enableCfOutputOnly="true"><cfscript>
try {
	count = 0;
	
	// get a ConcurrentHashMap of all application scope keys (application names)
	keys = createObject('java','coldfusion.runtime.ApplicationScopeTracker').getApplicationKeys();
	
	// loop and increment the counter
	while (keys.hasNext()) {
		count++;
		keys.next();
	}
	writeOutput(count);
}
catch (any e) {
	writeOutput(0);
}
</cfscript>