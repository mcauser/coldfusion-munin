<cfsetting enableCfOutputOnly="true"><cfscript>
try {
	// ask the session tracker for a count of all sessions on the server instance
	writeOutput(createObject('java','coldfusion.runtime.SessionTracker').getSessionCount());
}
catch (any e) {
	writeOutput(0);
}
</cfscript>