#let relsec_level = state("relsec_level", 1)

#let leveldown(level_state: relsec_level, n: 1) = level_state.update(x => x + n);

#let levelup(level_state: relsec_level, n: 1) = level_state.update(x => x - n);

#let dynheading(level_state: relsec_level, ..arguments) = [
  #level_state.display(x => [#heading(level: x, ..arguments)])
]

#let dynsec(level_state: relsec_level, ..arguments, heading, body) = [
  #dynheading(level_state: level_state, ..arguments, heading)
  #leveldown(level_state: level_state)
  #body
  #levelup(level_state: level_state)
]
