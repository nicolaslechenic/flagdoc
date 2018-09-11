<h1 align="center">Flagdoc</h1>

<br/>

<div align="center">
  <a href='https://semaphoreci.com/nicolaslechenic/flagdoc'>
    <img src='https://circleci.com/gh/nicolaslechenic/flagdoc/tree/master.svg?style=svg' alt='Build Status'>
  </a>

  <a href="https://codeclimate.com/github/nicolaslechenic/flagdoc/maintainability">
    <img src="https://api.codeclimate.com/v1/badges/f7ce259947e2019f1e9f/maintainability" />
  </a>

  <a href="http://inch-ci.org/github/nicolaslechenic/flagdoc">
    <img src="http://inch-ci.org/github/nicolaslechenic/flagdoc.svg?branch=master" />
  </a>
</div>

---

Flagdoc is an alternative to the rails notes inspired by the Yardoc syntax. Now, you can add customs flags with priority level

**./example/file.rb**

```ruby
# @flag [OLD, HIGH] being removed, prefere bar method
def foo
  # Do something...
end

# @flag [NEW] being removed, prefere bar method
def bar
  # Do something...
end

# @flag [TODO, LOW] must be renamed to baz
def bazz
  # Do something...
end
```

Will return something like that:

![Terminal STDOUT](/files/example.png)

## Levels:

- LOW
- NORMAL
- HIGH

