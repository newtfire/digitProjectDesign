## Steps for converting Shakespeare's Sonnets to XML

Looked for &, <, and > and found them not.

Got rid of extra returns with:
Find: `(\n)\n+`
Replace `\1`

Trimmed off leading spaces with:
Find:  `^\s+(.+)$`
Replace: `\1`

Add line element tags:
Find: `^.+$`
Replace (the whole match): `<line>\0</line>`

Find: `<line>([IVXLC]+)</line>`
Replace to create sonnet "wrappers":
`</sonnet>\n<sonnet number="\1">`

Pick up the extra `</sonnet>` tag from the top 
and move it to the end to wrap the last sonnet. 

Save the file as XML, and reopen. Add tagging by hand to mark title and author at the top.


