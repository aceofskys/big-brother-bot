<configuration>
<!-- 
 If you want to generate a new config file and make sure the format is 
 correct, you can invoke the setup procedure with the 
 command : b3_run -s b3.xml

 This is B3 main config file (the one you specify when you run B3 with the 
 command : b3_run -c b3.xml) 

 For any change made in this config file, you have to restart the bot.
 Whenever you can specify a file/directory path, the following shortcuts
 can be used :
  @b3 : the folder where B3 code is installed in
  @conf : the folder containing this config file
 -->
	<settings name="b3">
		<!--
			Next line: the parser defines the game:
			cod/cod2/cod4/cod5/cod6/cod7/iourt41/etpro/wop/smg/smg11/oa081 (it should NOT be 'changeme')
		-->
		<set name="parser">changeme</set>
		<!-- Your database info: [mysql]://[db-user]:[db-password]@[db-server[:port]]/[db-name] -->
		<set name="database">mysql://b3:password@localhost/b3</set>
		<!-- Name of the bot -->
		<set name="bot_name">b3</set>
		<!-- Ingame messages are prefixed with this code, you can use colorcodes -->
		<set name="bot_prefix">^0(^2b3^0)^7:</set>
		<set name="time_format">%I:%M%p %Z %m/%d/%y</set>
		<!-- The timezone your bot is in -->
		<set name="time_zone">CST</set>
		<!-- How much detail in the b3 logfile: 9 = verbose, 10 = debug, 21 = bot, 22 = console -->
		<set name="log_level">9</set>
		<!-- Name of the logfile the bot will generate -->
		<set name="logfile">b3.log</set>
	</settings>
	<settings name="server">
		<!-- The RCON pass of your gameserver -->
		<set name="rcon_password">password</set>
		<!-- The port the server is running on -->
		<set name="port">27960</set>
		<!-- The gameserver generates a logfile, put the path and name here (very important !) -->
		<set name="game_log">games_mp.log</set>
		<!-- If you want to run b3 on a different computer than where your server reside (remote access to the gamelog), you can connect via ftp or http by using the following syntax:
		<set name="game_log">ftp://username:password@serverhost/path/to/games_mp.log</set>
		<set name="game_log">http://serverhost/path/to/games_mp.log</set>
		Note: you can protect your http access with a .htaccess, b3 can authenticate itself.
		-->
		<!-- The public IP your gameserver is residing on -->
		<set name="public_ip">127.0.0.1</set>
		<!-- The IP the bot can use to send RCON commands to (127.0.0.1 when on the same box) -->
		<set name="rcon_ip">127.0.0.1</set>
		<!-- Is the gameserver running PunkBuster Anticheat: on/off -->
		<set name="punkbuster">on</set>
		<!-- Delay between each log reading. Set a higher value to consume less disk ressources or bandwidth if you remotely connect (ftp or http remote log access) -->
		<set name="delay">0.33</set>
		<!-- Number of lines to process per second. Set a lower value to consume less CPU ressources -->
		<set name="lines_per_second">50</set>
	</settings>
	<settings name="autodoc">
		<!-- Autodoc will generate a user documentation for all B3 commands 
		 * type : can be one of : html, htmltable, xml
		 * maxlevel : if you want to exclude commands reserved for higher levels
		 * destination : can be a file or a ftp url
		 by default, a html documentation is created in your conf folder
		-->
		<set name="type">html</set>
		<set name="maxlevel">100</set>
		<!-- <set name="destination">C:\Users\b3\Desktop\test_doc.htm</set> -->
		<!-- <set name="destination">ftp://user:pass@somewhere.com/www/test_doc.htm</set> -->
	</settings>
	<settings name="messages">
		<set name="kicked_by">$clientname^7 was kicked by $adminname^7 $reason</set>
		<set name="kicked">$clientname^7 was kicked $reason</set>
		<set name="banned_by">$clientname^7 was banned by $adminname^7 $reason</set>
		<set name="banned">$clientname^7 was banned $reason</set>
		<set name="temp_banned_by">$clientname^7 was temp banned by $adminname^7 for $banduration^7 $reason</set>
		<set name="temp_banned">$clientname^7 was temp banned for $banduration^7 $reason</set>
		<set name="unbanned_by">$clientname^7 was un-banned by $adminname^7 $reason</set>
		<set name="unbanned">$clientname^7 was un-banned $reason</set>
	</settings>
	<settings name="plugins">
		<set name="external_dir">@b3/extplugins</set>
	</settings>
	<plugins>
		<!-- Define here the plugins you want to load.
            
            Plugin order is important. Plugins that add new in-game commands all
			depend on the admin plugin. Make sure to have the admin plugin before
			them. 
            
            You can load a plugin but having it diabled by default. This
            allows to later enabled it ingame with the !enable command. To do so use
            the following syntax :
                <plugin name="adv" config="@conf/plugin_adv.xml" disabled="yes"/>
            
            You can override the plugin path (official plugins and extplugins folders) 
            by specifying the exact location of the plugin file with the 'path' attribute : 
                <plugin name="adv" config="@conf/plugin_adv.xml" path="c:/somewhere/else/"/>
            
            -->
		<plugin name="censor" config="@conf/plugin_censor.xml" />
		<plugin name="spamcontrol" config="@conf/plugin_spamcontrol.xml" />
        <plugin name="admin" config="@conf/plugin_admin.xml" />
		<plugin name="tk" config="@conf/plugin_tk.xml" />
		<plugin name="stats" config="@conf/plugin_stats.xml" />
		<plugin name="pingwatch" config="@conf/plugin_pingwatch.xml" />
		<plugin name="adv" config="@conf/plugin_adv.xml" />
		<plugin name="status" config="@conf/plugin_status.xml" />
		<plugin name="welcome" config="@conf/plugin_welcome.xml" />
		<plugin name="punkbuster" config="@conf/plugin_punkbuster.xml" />

		<!-- The next plugins are external, 3rd party plugins and should reside in the external_dir. Example: -->
		<!-- plugin config="@b3/extplugins/conf/newplugin.xml" name="newplugin" -->

		<!-- You can add new/custom plugins to this list using the same form as above. -->
		
		<!--
			This is a non-standard plugin, and quite resource heavy. Please take
			a look in the B3 forums (look for XLR Extensions) for more
			information before enabling this. Extra database tables are
			necessary.
		<plugin name="xlrstats" config="@b3/extplugins/conf/xlrstats.xml"/>
		-->
		
		<!-- You can find many others plugin for B3 which can extend functionalities a lot !
		Please take a look at the official website for more informations. -->
	</plugins>
</configuration>