behaviours = {}
options = {}

share.attach = attach = (behaviour, args...) ->
  if _.isString behaviour
    behaviour = behaviours[behaviour]
    opts = options[behaviour]

  if _.isFunction behaviour
    context =
      collection: @
      options: opts

    behaviour.apply context, args

  else
    console.warn 'Behaviour not found'

  return

class CollectionBehaviours

  @attach: (collection, args...) ->
    attach.apply collection, args

  @configure: (name, options) ->
    if name of behaviours
      options[name] = options

    else
      console.warn 'Configure failed, behaviour not found'

  @define: (name, behaviour, options) ->
    if name of behaviours and not options?.replace
      console.warn 'Behaviour already defined, use replace option to override'

    else
      behaviours[name] = behaviour
