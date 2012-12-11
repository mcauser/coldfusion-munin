<cfsetting enableCfOutputOnly="true"><cfscript>
try {
	// output the uptime in days as nn.nn (eg. 2.00 = 2 days)
	// this is now performed in the munin plugin using sprintf - faster in there than here
	//writeOutput(createObject('java','java.lang.Double').parseDouble(createObject('java','java.text.DecimalFormat').init('0.00').format(dateDiff('s',server.coldfusion.expiration,now()) / javaCast('long',60) / javaCast('long',60) / javaCast('long',24))));
	
	// output the uptime in seconds
	writeOutput(dateDiff('s',server.coldfusion.expiration,now()));
}
catch (any e) {
	writeOutput(0);
}
</cfscript>