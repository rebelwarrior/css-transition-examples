## Alert CSS

<pre><code class="css" data-trim data-noescape>.alert-wrapper, .alert-details {
    overflow: hidden;
    <mark>transition: height 1000ms;</mark>
    <mark>height: 0px;</mark>
}
</code></pre>

<div class="fragment">...and then, to start transition to target value:</div>

<pre class="fragment"><code class="elm" data-trim data-noescape>.alert-wrapper, .alert-details {
div [ id "alert-info"
    , class "alert-wrapper row"
    , <mark>style [ ( "height", "82px" ) ]</mark>
    ]
    [ ... ]
</code></pre>

note:
* Here is the associated CSS style for the two wrapper elements that are contained in the alert's
HTML structure
* You can see that <code>transition: height;</code> specification, and that the initial height
value is set to zero pixels.
* We're setting the duration to 1000ms so that it's more apparent. You would probably use something
a little snappier in your application, like 600ms.
* We set <code>overflow: hidden;</code> to make the content initially invisible.
* We render the closed state of the alert with this style applied
* And then, to start the animated transition to a dynamically calculateed target value,
we render again in Elm with a <code>style</code> attribute that sets the height to the new value.