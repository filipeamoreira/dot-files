;; Add bundle exec to the default cucumber command
(setq feature-cucumber-command "bundle exec rake cucumber CUCUMBER_OPTS=\"{options}\" FEATURE=\"{feature}\"")
