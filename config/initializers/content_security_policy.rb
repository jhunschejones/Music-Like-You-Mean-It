# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

if Rails.env.production?
  Rails.application.config.content_security_policy do |policy|
    policy.default_src     :none
    policy.font_src        :self
    policy.img_src         :self, :data
    policy.object_src      :none
    policy.script_src      :self, "https://js-agent.newrelic.com", "https://bam.nr-data.net"
    policy.style_src       :self, :unsafe_inline
    # https://docs.newrelic.com/docs/browser/new-relic-browser/getting-started/compatibility-requirements-browser-monitoring
    policy.connect_src     :self, "https://bam.nr-data.net", "https://bam-cell.nr-data.net"

    policy.form_action     :self
    policy.base_uri        :self
    policy.frame_ancestors :none
    policy.frame_src       "https://www.youtube.com/"

    # If you are using webpack-dev-server then specify webpack-dev-server host
    # policy.connect_src :self, :https, "http://localhost:3035", "ws://localhost:3035"

    # Specify URI for violation reports
    # policy.report_uri "/csp-violation-report-endpoint"
  end
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# https://github.com/turbolinks/turbolinks/issues/430
Rails.application.config.content_security_policy_nonce_generator = -> (request) do
  # use the same csp nonce for turbolinks requests
  if request.env['HTTP_TURBOLINKS_REFERRER'].present?
    request.env['HTTP_X_TURBOLINKS_NONCE']
  else
    SecureRandom.base64(16)
  end
end

# Set the nonce only to specific directives
Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
