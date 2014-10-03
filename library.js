"use strict";

var Meta = module.parent.require('./meta'),
	plugin = {};

plugin.init = function(app, middleware, controllers, callback) {
	// We create two routes for every view. One API call, and the actual route itself.
	// Just add the buildHeader middleware to your route and NodeBB will take care of everything for you.

	app.get('/admin/plugins/olark', middleware.admin.buildHeader, renderAdmin);
	app.get('/api/admin/plugins/olark', renderAdmin);
	app.get('/olark/config', function(req, res) {
		Meta.settings.getOne('olark', 'siteId', function(err, setting) {
			res.send(setting);
		});
	});

	callback();
};

function renderAdmin(req, res, next) {
	res.render('admin/plugins/olark', {});
}

plugin.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/plugins/olark',
		icon: 'fa-comments-o',
		name: 'Olark'
	});

	callback(null, header);
};

module.exports = plugin;