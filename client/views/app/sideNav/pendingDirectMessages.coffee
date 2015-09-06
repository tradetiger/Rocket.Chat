Template.pendingDirectMessages.helpers
	rooms: ->
		return ChatSubscription.find { t: { $in: ['d']}, f: { $ne: true }, open: true, pending: true }, { sort: 't': 1, 'name': 1 }
	isActive: ->
		return 'active' if ChatSubscription.findOne({ t: { $in: ['d']}, f: { $ne: true }, open: true, rid: Session.get('openedRoom') }, { fields: { _id: 1 } })?

Template.pendingDirectMessages.events
	'click .add-room': (e, instance) ->
		SideNav.setFlex "directMessagesFlex"
		SideNav.openFlex()
