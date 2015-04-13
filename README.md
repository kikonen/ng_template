#NgTemplate

Manage angularjs templates as view partials in rails assets pipeline.

This a bit similar gem to (angular-rails-templates)[https://github.com/pitr/angular-rails-templates] but utilizes normal rails view partials instead.

## Usage

app/views/some/ui/show.html.erb:

    <%= ng_template_include 'some/path' %>
