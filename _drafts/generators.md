% What about generators?

| "machines ... but give them something tough like solacing a widow..."

Somewhere a year ago, I was participating in a project as Business Analyst, our team lead proposed the team to write straight Swagger instead of writing requirements for back-end (use cases, entities, functions, etc.) The project was nothing special actually, just a data-driven app with separated Java back-end and Angular front-end.

Of course, it is not the case at all, requirements are the essential side of any serious project that couldn't be skipped that way because it speaks to all the project stakeholders than just developers. But the thought to develop such a schema is really great and practical one.  Having such stuff brings a few substantial benefits, like having backend described, the ability to generate stubs for backed services, client libraries... The one that any consumer of the app would rather strive to have.

The idea to have the specification some kind of human-readable is brilliant. But does one really think that writing YAML or JSON is the best way to be writing the specification?

> My first attempt to create a requirements management system had started from an idea to write and store requirements in YAML. But very soon it became clear that didn't suit at all the way that analyst works. One cannot create a product based on data storage format only, there must be some interactors.

There are at least two epics here that I can see...

> __1)__ As a Consumer (end-user, developer, tester, integrator, analyst), at any time, I want to see the specification of the back-end, so I can acknowledge what the back-end does and maybe try some methods.

> __2)__ As a Supplier (systems analyst, developer, technical writer), at any time, I want to write some pieces of the back-end specification, so my consumer will appreciate so much. I want to start a new one; continue an old one that I started yesterday; copy from a previous project, or use some part that ready-made.

When I see such specifications, I see it as some sort of "Specification/Configuration Domain", where the best way to produce the specification/configuration is to create a Domain Specific Language (DSL). And the best language to produce DSL is the Ruby of course, just because it is both the DLS and the plain Ruby at the same time. And of course a modern trend "stuff"-as-code :)

Just for fun, let's take some [Swagger Specs](https://editor.swagger.io/) and try to turn them into a DSL ...

```yaml
paths:
  /pet:
    post:
      tags:
      - "pet"
      summary: "Add a new pet to the store"
      description: ""
      operationId: "addPet"
      consumes:
      - "application/json"
      - "application/xml"
      produces:
      - "application/xml"
      - "application/json"
      parameters:
      - in: "body"
        name: "body"
        description: "Pet object that needs to be added to the store"
        required: true
        schema:
          $ref: "#/definitions/Pet"
      responses:
        "405":
          description: "Invalid input"
      security:
      - petstore_auth:
        - "write:pets"
        - "read:pets"
```

For me, the DSL code below is more clear and at the same time much more concise.

```ruby
path('pet') do
  method 'post' do
    summary "Add a new pet to the store"
    description "This method bla-blah"

    consumes "application/json", "application/xml"
    # and maybe shorter
    produces :json, :xml

    parameters do
      in 'body', :required, name: "body", description: "..."
    end

    response "200", "OK"
    response "405", "Invalid input"
  end
end
```

Of course, It will take a few days of effort to implement the model and its DSL. But I'm sure it will be much more efficient than just writing plain YAML in the long run.

I also saw some implementation of such DSL inside Rails controller. For me the controller and its specification should be separated. At a first glance it seems attractive to describe the service in a manmer that Grape API suggests, but at what price ... think the "thick controller" mantra
