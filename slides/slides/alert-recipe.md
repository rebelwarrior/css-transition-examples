##  Recipe for the animated alert widget

<ul>
<li class="fragment">HTML structure
<li class="fragment">Elm model state
<li class="fragment">Styling with the CSS <code>transition</code> property
<li class="fragment">Dispatching a DOM event in JavaScript
<li class="fragment">Decoding content heights with Elm JSON decoders
<li class="fragment">Changing state in Elm <code>update</code> function
<li class="fragment">Elm <code>view</code> function with event handlers
</ul>

note:
So how do we put this all together to animate the alert example?

We need all these pieces:
* A well-defined HTML DOM tree so we can query the height of content that will be animated
* Associated styles in CSS that include the transition property
* Elm types that can represent the visibility state of the widget
* Some way to probe the target content height (preferably in Elm)
* An update function that will respond to programmer and end-user actions and visibility state changes
* A view function that will set the initial and target heights
