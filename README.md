POC for https://github.com/machinio/cuprite/issues/76

run:
```
bundle
env CUPRITE_TIMEOUT=5 bundle exec rspec spec/features/test_spec.rb
```

`CUPRITE_TIMEOUT` value doesn't actually matter.

you should get the following:

```
Failures:

  1) test test
     Failure/Error: visit root_path

     ThreadError:
       Attempt to unlock a mutex which is locked by another thread
     # ./spec/features/test_spec.rb:5:in `block (2 levels) in <top (required)>'
     # ------------------
     # --- Caused by: ---
     # Capybara::Cuprite::JavaScriptError:
     #   Error: foo error
     #       at HTMLDocument.<anonymous> (http://127.0.0.1:62215/:11:15)
     #   ./spec/features/test_spec.rb:5:in `block (2 levels) in <top (required)>'
```

Error is caused by having an intial page load that takes longer than the `timeout` configured in cuprite *and* having with `js_errors: true` *and* having an error raised on the page during the page load.

relevant files:

* `app/controllers/application_controller.rb`
* `app/views/application/root.html`
* `spec/rails_helper.rb`

verified with cuprite version 8bde777fa687d56f7b901bcc06bca7c0c79a597a
