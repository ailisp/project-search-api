require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "GET /projects should return all projects" do
    get "/projects"
    projects = JSON.parse(@response.body)
    assert_equal(8185, projects.length)
    assert_includes(projects[0], "Project School Name")
  end

  test "GET /projects/HIGH should search school or description has HIGH" do
    get "/projects/HIGH"
    projects = JSON.parse(@response.body)
    projects.each do |p|
      assert(p['Project School Name'].include?('HIGH') || p['Project Description'].include?('HIGH'))
    end
  end

  test "GET /projects/HIGH?actual_start_date=2015-02-04 should give projects of exact start date" do
    get "/projects/HIGH?actual_start_date=2015-02-04"
    projects = JSON.parse(@response.body)
    projects.each do |p|
      assert('2015-02-04', p['Project Phase Actual Start Date'])
    end
  end

  test "params actual_start_date_min and actual_start_date_max should give date range" do
    get "/projects/HIGH?actual_start_date_min=2015-02-04&actual_start_date_max=2017-01-01"
    projects = JSON.parse(@response.body)
    projects.each do |p|
      assert(Date.parse('2015-02-04') <= Date.parse(p['Project Phase Actual Start Date']))
      assert(Date.parse(p['Project Phase Actual Start Date']) <= Date.parse('2017-01-01'))
    end
  end

  test "pagination should gives result page by page" do
    get "/projects/HIGH?actual_start_date_min=2015-02-04&actual_start_date_max=2017-01-01"
    projects_all = JSON.parse(@response.body)
    get "/projects/HIGH?actual_start_date_min=2015-02-04&actual_start_date_max=2017-01-01&per_page=2"
    projects_page1 = JSON.parse(@response.body)
    assert_equal(2, projects_page1['data'].length)
    assert_equal(1, projects_page1['page'])
    assert_equal(projects_all[0], projects_page1['data'][0])
    assert_equal(projects_all[1], projects_page1['data'][1])

    total_pages = projects_page1['total_pages']

    (2..(total_pages-1)).each do |p|
      get "/projects/HIGH?actual_start_date_min=2015-02-04&actual_start_date_max=2017-01-01&per_page=2&page=#{p}"
      page = JSON.parse(@response.body)
      assert_equal(2, page['data'].length)
      assert_equal(p, page['page'])
      assert_equal(projects_all[(p-1)*2], page['data'][0])
      assert_equal(projects_all[(p-1)*2+1], page['data'][1])
    end

    get "/projects/HIGH?actual_start_date_min=2015-02-04&actual_start_date_max=2017-01-01&per_page=2&page=#{total_pages}"
    page = JSON.parse(@response.body)
    assert_equal(total_pages, page['page'])
    assert_equal(projects_all[-(page['data'].length)..-1], page['data'])
  end
end
