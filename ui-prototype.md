AI Dir
------

UI prototype html, vuejs, one html file

- list requests
	- button: create request
	- table (with rows)
		- title (link to card)
		- selected files
		- buttons:
			- edit
			- delete (with confirmation)
- form create/edit
	- title
	- prompt
	- list of files (checkbox)
	- buttons:
		- create/save (after create or save - show card page)
		- cancel (return on list if create form or on card if edit form)
- page show card
	- title
	- prompt
	- selected files
	- buttons:
		- edit
		- delete (with confirmation)
		- proceed (sending prompt and file's content to AI)
	- result (response from AI)
