RSpec::Matchers.define :have_notice_alert do |alert_message|
  match do |page|
    page.has_css?('.alert.alert-notice', text: alert_message, visible: :all)
  end

  failure_message do
    "expected that page would have alert notice of #{alert_message} but was not found"
  end

  match_when_negated do |page|
    page.has_no_css?('.alert.alert-notice', text: alert_message, visible: :all)
  end

  failure_message_when_negated do
    "expected that page would not have alert notice of #{alert_message} but was found"
  end
end

RSpec::Matchers.define :have_danger_alert do |alert_message|
  match do |page|
    page.has_css?('.alert.alert-danger', text: alert_message, visible: :all)
  end

  failure_message do
    "expected that page would have alert danger of #{alert_message} but was not found"
  end

  match_when_negated do |page|
    page.has_no_css?('.alert.alert-danger', text: alert_message, visible: :all)
  end

  failure_message_when_negated do
    "expected that page would not have alert danger of #{alert_message} but was found"
  end
end
