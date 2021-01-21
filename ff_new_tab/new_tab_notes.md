# Purpose
I want a new tab page that has the Vimium extension enabled.
Other extensions that customize the new tab page still prevent the Vimium extension.

# Solution
Use autoconfig files in Firefox, as outlined here: <https://support.mozilla.org/en-US/questions/1304327>
This link: <https://support.mozilla.org/en-US/questions/1283835> gave a way of moving focus from the address bar,
but it doesn't see to work.

The relevant files I added are:
/Applications/Firefox.app/Contents/Resources/firefox.cfg
/Applications/Firefox.app/Contents/Resources/defaults/pref/autoconfig.js

The regular Firefox home page can still be reached at:
about:newtab

On the new tab, focus still goes to the Firefox address bar automatically, and by default
hitting Tab will focus some other menu items before the page.
TODO: Make note of the setting to change in about:config to make tab focus the page directly
