require 'rails_helper'

describe TestController do
  def app
    Rails.application
  end

  let(:template_1) {
    <<EOF
<script type='text/ng-template' id='test/test_1'>
<div>
  TEST_1
</div>

</script>
EOF
  }

  let(:template_2) {
<<EOF
<script type='text/ng-template' id='test/test_2'>
<div>
  TEST_2
</div>

</script>
EOF
  }

  let(:template_3) {
<<EOF
<script type='text/ng-template' id='another/test_2'>
<div>
  ANOTHER_2
</div>

</script>
EOF
  }

  let(:template_4) {
<<EOF
<script type='text/ng-template' id='another/test_1'>
<div>
  ANOTHER_1
</div>

</script>
EOF
  }

  let(:templates) {
    [
      template_1,
      template_2,
      template_3,
      template_4,
    ]
  }

  let(:ignored_templates) {
    [
      "TEST_IGNORE_1",
      "ANOTHER_IGNORE_1",
    ]
  }


  it 'include' do
    get '/'

    data = last_response.body

    templates.each do |template|
      expect(data).to include(template)
    end
  end

  it 'ignore' do
    get '/'

    data = last_response.body

    expect(data).not_to include("IGNORE")

    ignored_templates.each do |template|
      expect(data).not_to include(template)
    end
  end
end
