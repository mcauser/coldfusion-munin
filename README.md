Munin plugins for ColdFusion
============================

A set of munin plugins for monitoring ColdFusion servers

Plugins
-------
* coldfusion_applications : active application scopes
* coldfusion_sessions     : active session scopes across all applications
* coldfusion_uptime       : server uptime

Requirements
------------
* ColdFusion 8,9 or 10

Installation
------------

1. copy the plugin into /usr/share/munin/plugins/
2. make a link in /etc/munin/plugins/

		ln -s /usr/share/munin/plugins/coldfusion_applications /etc/munin/plugins/coldfusion_applications

3. copy the ColdFusion template into your webroot or desired location
4. if the templates are not accessible at the default location http://localhost:80/template_name.cfm customise the url in /etc/munin/plugin-conf.d/munin-node

		[coldfusion_applications]
		env.url     http://localhost:%d/coldfusion_applications.cfm
		env.ports   80
		env.timeout 30

5. restart munin

		/etc/init.d/munin-node restart

Screenshots
-----------

![ColdFusion Applications](https://raw.github.com/mcauser/coldfusion-munin/master/screenshots/coldfusion_applications-day.png)
![ColdFusion Sessions](https://raw.github.com/mcauser/coldfusion-munin/master/screenshots/coldfusion_sessions-day.png)
![ColdFusion Uptime](https://raw.github.com/mcauser/coldfusion-munin/master/screenshots/coldfusion_uptime-day.png)

Testing
-------
On the host where munin-node runs, check to see whether the plugin runs through munin-run:

	# munin-run coldfusion_applications autoconf
	returns: yes

Run the plugin:

	# munin-run coldfusion_applications
	returns: count.value 1

View the configuration:

	# munin-run coldfusion_applications config
	returns:
	graph_title ColdFusion applications
	graph_category ColdFusion
	graph_args --base 1000
	graph_vlabel active applications
	graph_info Total number of active application scopes on the server instance
	count.info Total active applications
	count.label Active
	count.draw AREA
