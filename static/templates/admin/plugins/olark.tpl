<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">Olark Settings</div>
			<div class="panel-body">
				<form role="form" class="olark-settings">
					<p class="lead">
						Register for an Olark account and retrieve your Site-ID. It can be found here:
						<a href="https://www.olark.com/settings/code">https://www.olark.com/settings/code</a>
					</p>
					<div class="form-group">
						<label for="siteId">Site ID</label>
						<input type="text" id="siteId" name="siteId" title="siteId" class="form-control" placeholder="1234-567-89-1011"><br />
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">Control Panel</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">Save Settings</button>
			</div>
		</div>
	</div>
</div>

<script>
	require(['settings'], function(Settings) {
		Settings.load('olark', $('.olark-settings'));

		$('#save').on('click', function() {
			Settings.save('olark', $('.olark-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'olark-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				})
			});
		});
	});
</script>