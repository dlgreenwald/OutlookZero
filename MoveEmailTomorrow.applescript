on run argv
	if (count of argv) > 0 then
		set thefolder to item 1 of argv
	else
		set thefolder to text returned of (display dialog "Enter Folder to move to Inbox" default answer "Tomorrow")
	end if
	
	tell application "Microsoft Outlook"
		if it is running then
			set theContent to ""
			set InboxFolder to mail folder "Inbox" of default account
			set theMessages to messages of mail folder thefolder of InboxFolder
			repeat with theMessage in theMessages
				set is read of theMessage to false
				move theMessage to InboxFolder
			end repeat
		end if
	end tell
end run


