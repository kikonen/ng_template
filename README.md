#NgTemplate

Manage angularjs templates as view partials in rails assets pipeline.

This a bit similar gem to (angular-rails-templates)[https://github.com/pitr/angular-rails-templates] but utilizes normal rails view partials instead.

## Install

Gemfile
```ruby
gem 'ng_template'
```

## Usage

app/controllers/aplication_controller.rb:
```ruby
class ApplicationController < ActionController::Base
  ...
  helper NgTemplate::TemplateHelper
end
```

app/views/some/ui/show.html.erb:
```erb
<%= ng_template_include 'some/path' %>
```

OR

```erb
<%= ng_template_include 'some/path', prefix: '_some_prefix_' %>
```
