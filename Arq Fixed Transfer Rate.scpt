# a simple Applescript to change transfer speed settings in Arq Backups
# this script selects "Fixed" transfer rate 
# Note: specific transfer rate limit should already be set
# Note: tested on Arq Backups v5, OSX Mohave 

try
	#startup delay to allow for a slow connection if rate was on Max
	delay 120
	
	# bring Arq to active/front
	tell application "Arq"
		activate
		
		delay 3
		
	end tell
	
	# open the Arq Preferences pane
	tell application "System Events"
		tell process "Arq"
			tell menu bar 1
				
				tell menu bar item "Arq"
					tell menu "Arq"
						
						click menu item "Preferences…"
						
					end tell
					
				end tell
			end tell
			
			
			
		end tell
		
		delay 1
		
		# select the second pane, "Network"
		click UI element "Network" of toolbar 1 of window "Preferences" of process "Arq"
		
		delay 1
		
		# adjust the transfer rate setting
		click radio button "Fixed transfer rate" of radio group 1 of window "Preferences" of application process "Arq"
		
		delay 2
		
		# close the Preferences dialog
		# Arq processes the change even if this fails
		keystroke "w" using command down
		
		
	end tell
	
	
	
	
	
	return true
	
on error
	return false
	
end try


