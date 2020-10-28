# XPath Exercise 4

#### Question 1:

There are two books referenced in the syllabus using the tag <bibl>. What XPath will return a semicolon-separated list of the authors?

  *  *Arrow Operator* `//bibl/author => string-join("; ")` (1 result)

  * *Wrapper* `string-join(//bibl/author, "; ")`   (1 result)
  
  The above solutions will give you this result, and you may notice that the last set isn't really separating out each of the authors:
  
  ```
  Michael Kay; Bruce Hyslop, Lenny Burdette, and Chris Casciano
  ```  
It turns out this way because the second `<bibl>` element in our document contains a short list of names in its `<author>` element.
If you want to actually turn *each* of the authors into a new semicolon-separated list with XPath, we need to chain some functions together. We suggest using `tokenize()` for this to set up the pieces we want to put together. The `tokenize()` function will basically *cut* a string on the characters you indicate (and it can do that with a regex, too, not that this matters here.) `tokenize()` will work to split up a string of text without losing any data even if the thing it's using the split isn't present. So here's what I'd do to first cut the author list down to just their names, and then string-join them together:

```
//bibl/author ! tokenize(., ', ') ! tokenize(., 'and ')[last()] => string-join("; ")
```

Notice how you wind up trimming the string-join() function when you use the arrow operator. The arrow operator itself is taking the place of its usual first argument.

#### Question 2:

##### a. Which 'div' elements contain references to 'homework'? How many results do you return?
  * Simplest way using matches() with regex: `//div[matches(., "[Hh]omework")]`
  * `//div[contains(., "homework") or contains(., "Homework")]` (21 results)
  
##### b. Can you figure out how to retrieve the immediate parent element containing the word "homework"? (Hint: it involves looking for any element below the div and then its text() node, since we need the element whose *text* contains the word "homework.")
  * One way to write this, using full node identifiers: `element()` and `text()`:  `//div/descendant::element()[text()[matches(., "[Hh]omework")]] ! name()` (12 results)
  * Simpler way to write this, using `*` as abbreviation for the element() node: `//div/descendant::text()[matches(., "[Hh]omework")]/parent::* ! name()`

#### Question 3:

##### a. What XPath returns all the Fridays on the syllabus? (Scroll through the document looking for the date elements to help determine this.)

  * *Matches* `//date[matches(., "F \d{2}-\d{2}")]` (15 results)

  * *Contains* `//date[contains(., "F ")]`           (15 results)

##### b. Now, what if we want to return those dates in their ISO format, as yyyy-mm-dd? Can you retrieve that with XPath? (Hint: Look at the attribute values on the date elements.)

  * *Matches* `//date[matches(., "F \d{2}-\d{2}")]/@when` (15 results)

  * *Contains* `//date[contains(., "F ")]/@when`           (15 results)

##### c. Return a string-joined list of all these dates, separated with a comma and a space.

  * *Arrow Operator with Matches function*  `//date[matches(., "F \d{2}-\d{2}")]/@when => string-join(", ")` (1 result)

  * *Wrapper with Matches function* `string-join(//date[matches(., "F \d{2}-\d{2}")]/@when, ", ")`   (1 result)

  * *Arrow Operator with Contains function* `//date[contains(., "F ")]/@when => string-join(", ")`           (1 result)

  * *Wrapper with Contains function* `string-join(//date[contains(., "F ")]/@when, ", ")`             (1 result)

#### Question 4:

##### a. How many div elements of @type 'assign' contain references to word "GitHub"?

  * `//div[@type="assign"][contains(., "GitHub")]`    (10 results)

  * `//div[@type="assign" and contains(., "GitHub")]` (10 results)

##### b. Find the longest and shortest div elements of this type (that contain the word "GitHub") in the document. How long and short are they? Hint: You will need to use min(), max(), and the string-length() function here, as well as some complex predicates.

###### Max()

  * *Arrow Operator with Two Predicates* `//div[@type="assign"][contains(., "GitHub")]/string-length(.) => max()`    (2359 max)

  * *Wrapper with Two Predicates* `max(//div[@type="assign"][contains(., "GitHub")]/string-length(.))`        (2359 max)

  * *Arrow Operator with And* `//div[@type="assign" and contains(., "GitHub")]/string-length(.) => max()` (2359 max)

  * *Wrapper with And* `max(//div[@type="assign" and contains(., "GitHub")]/string-length(.))`     (2359 max)

###### Min()

  * *Arrow Operator Two Predicates* `//div[@type="assign"][contains(., "GitHub")]/string-length(.) => min()`    (223 min)

  * *Wrapper with Two Predicates* `min(//div[@type="assign"][contains(., "GitHub")]/string-length(.))`        (223 min)
   * *Arrow Operator with And* `//div[@type="assign" and contains(., "GitHub")]/string-length(.) => min()` (223 min)

    * *Wrapper with And* `min(//div[@type="assign" and contains(., "GitHub")]/string-length(.))`     (223 min)

#### Question 5:

##### a. Working only with the @when attribute on the date elements on our syllabus file, convert those dates in the return window so that they display days of the week (and anything else you wish from the various available date-formatting codes. Record at least two different ways you adjusted this code to output different formats of date that you tried here, and their output.
  * Try this! what format of the date does this retrieve? `//date//@when/format-date(xs:date(.), "[MNn] [D], [Y0001]")`

  * Try this! what format of the date does this retrieve? `//date//@when/format-date(xs:date(.), "[D]/[M]/[Y]")`

##### b. Now that you see how picture strings work in the format-date() function, we think you now know enough to take a numerical string of text from the @when attribute, convert it to retrieve days of the week, and then output only the Friday dates on the syllabus.

  * Format the date, and then use a contains() function to filter the Fridays: `//date/@when/format-date(xs:date(.), '[F], [MNn] [D], [Y]')[contains(., "Friday")]` (14 results)

##### c. Modifying your functions, can you output all of the Friday dates in October only? Record the XPath. Hint: You probably want multiple predicates for this.

  * Our solution only needed to modify the contains() function above a little!  `//date/@when/format-date(xs:date(.), '[F], [MNn] [D], [Y]')[contains(., "Friday, October")]` (5 results)
