# OutlookZero

For those of you that remember [Mailbox](https://www.theverge.com/2015/12/8/9873268/why-dropbox-mailbox-shutdown) the greatest InboxZero application of all time.  Here is a set of applescripts which enable the same funtionality in Outlook on OSX.

On a schedul emails in certain outlook directories will be movied back into the root of your inbox and marked as unread.

The following folders in your inbox are handled in the following conditions.  The plists use [StartCalendarInterval](https://alvinalexander.com/mac-os-x/launchd-plist-examples-startinterval-startcalendarinterval) so they are well behaved, will not wake the system from sleep, and will only run once on resume if multiple events have passed while suspended.

|Folder              |Timing                              |
|--------------------|------------------------------------|
|Inbox/In a Bit      |On the hour ever hour               |
|Inbox/This Afternoon|At 10am every day                   |
|Inbox/Tomorrow      |At 5am every day                    |
|Inbox/Next Week     |At 5am on Mondays                   |
|Inbox/Next Month    |At 5am on the first day of the Month|

## Limitations
* this is running locally while changes are synced to the server if your desktop is shutdown, not connected to the network etc, the changes on the server will be delayed.

## Install
1) create the following folders in your outlook mailbox:
  ```
  Inbox/In a Bit
  Inbox/This Afternoon
  Inbox/Tomorrow
  Inbox/Next Week
  Inbox/Next Month
  ```
2) clone the repo into your home directoy.  The plist files assume a directory of `~/OutlookZero/...`
3) copy \*.plist to your users launchctl directory.  `cp *.plist ~/Library/LaunchAgents/`
4) configure launchctl to launch each plist at login.
```
launchctl load ~/Library/LaunchAgents/com.outlookZero.MoveAfternoonEmailsToInbox.plist
launchctl load ~/Library/LaunchAgents/com.outlookZero.MoveHourlyEmailsToInbox.plist
launchctl load ~/Library/LaunchAgents/com.outlookZero.MoveMonthEmailsToInbox.plist
launchctl load ~/Library/LaunchAgents/com.outlookZero.MoveTomorrowEmailsToInbox.plist
launchctl load ~/Library/LaunchAgents/com.outlookZero.MoveWeeklyEmailsToInbox.plist
```
