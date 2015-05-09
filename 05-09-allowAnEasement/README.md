Oblique Strategy: Allow an easement (an easement is the abandonment of a stricture)

Hrm, I guess oblique strategies are just starting points... : )


I think the right way to do this would be to make "ball" objects.  As things moved on I realized how silly this was getting.

In terms of the code, there's this line:

```
    if (!easement) {...
```

Which feels like a cop out of the assignment.  I would have much rather prefered:

```
    if (easement) { break }
```

Or something like that.
