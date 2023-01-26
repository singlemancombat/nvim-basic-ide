return {
  yaml = {
    schemaStore = {
      enable = true
    },
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
        schemas = require("schemastore").json.schemas(),
      },
    },
  }
}
