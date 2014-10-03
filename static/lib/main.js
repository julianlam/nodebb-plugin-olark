"use strict";

$(window).on('action:connected', function() {
	if (!window.location.pathname.match(/^\/admin/)) {
		$.get('/olark/config', function(siteId) {
			if (siteId) {
				templates.parse('olark-embed', {
					siteId: siteId
				}, function(html) {
					$(html).appendTo(document.head);
				});
			} else {
				if (console) {
					console.log('[olark] Plugin active but siteId not set.');
				}
			}
		});
	}
});