provider "op" {}

data "op_vault" "this" {
  name = "Personal"
}

data "op_item_login" "666" {
  name = "SomeLogin666"
  vault = "${data.op_vault.this.id}"
}
data "op_item_login" "999" {
  name = "SomeLogin999"
  vault = "${data.op_vault.this.id}"
}

data "op_item_document" "this" {
  name = "Test TXT"
  vault = "${data.op_vault.this.id}"
}

output "doc_content" {
  value = "${data.op_item_document.this.content}"
}

resource "op_item_document" "this3" {
  name = "Some doc"
  tags = [
    "tag for doc",
    "system",
  ]
  vault = "${data.op_vault.this.id}"
  file_path = "./test.txt" 
}
resource "random_string" "secret" {
  length = "32"
}

data "op_item_secure_note" "this" {
  name = "RelatedNote"
}

resource "op_item_secure_note" "sn" {
  name = "New Secure Note"
  notes = "${random_string.secret.result}"
  tags = [
    "this",
    "is",
    "Tagssssss",
  ]
  vault = "${data.op_vault.this.id}" 
  
  section = {
    name = "First Section"

    field = {
      name = "Address"
      address = {
        city = "New York"
        zip = "01001"
        country = "us"
        street = "Manheten"
        region = "Central Park"
        state = "NY"
      }
    }
  }
}

resource "op_item_identity" "8888888" {
  name = "Andrii Indetity"
  vault = "${data.op_vault.this.id}"
  tags = [
    "this",
    "is",
    "Tagssssss",
  ]
  notes = "**Some** _awesome_ ~Markdown~"

  identification = {
    firstname = "Andrii"
    initial = "AN"
    lastname = "Nasinnyk"
    sex = "male"
    birth_date = 575553660 //unix-time
    occupation = "occupation"
    company = "company"
    department = "department"
    job_title = "job_title"
    field = {
      string = "extra"
    }
  }

  address = {
    address = {
      city = "Kyiv"
      street = "11 Line"
      country = "ua"
      zip = "46000"
      region = "Region"
      state = "State"
    }
    default_phone = "+38000000000"
    home_phone = "+38000000000"
    cell_phone = "+38000000000"
    business_phone = "+38000000000"
    field = {
      string = "extra"
    }
  }

  internet = {
    username = "nas1k"
    email = "andriy.nas@gmail.com"
    field = {
      string = "extra"
    }
  }

  section = {
    name = "extra"

    field = {
      name = "text"
      string = "text"
    }
  }
}

resource "op_item_password" "8888888" {
  name = "New_888_Password"
  vault = "${data.op_vault.this.id}"
  password = "${random_string.secret.result}"
  url = "https://whoma.ai"
  tags = [
    "this",
    "is",
    "Tagssssss",
  ]
  notes = "**Some** _awesome_ ~Markdown~"
  section = {
    name = "First Section"

    field = {
      name = "Address"
      string = "text"
    }
  }
}

resource "op_item_login" "8888888" {
  name = "New_888_88888"
  vault = "${data.op_vault.this.id}"
  username = "admin"
  password = "${random_string.secret.result}"
  url = "https://whoma.ai"
  tags = [
    "this",
    "is",
    "Tagssssss",
  ]
  notes = "**Some** _awesome_ ~Markdown~"
  section = {
    name = "First Section"

    field = {
      name = "Address"
      address = {
        city = "New York"
        zip = "01001"
        country = "us"
        street = "Manheten"
        region = "Central Park"
        state = "NY"
      }
    }

    field = {
      name = "Text"
      string = "text value"
    }

    field = {
      name = "password"
      concealed = "concealed"
    }

    field = {
      name = "Website Url"
      url = "https://google.com"
    }
  }

  section = {
    name = "Second Section"

    field = {
      name = "Email address"
      email = "andr@kapitan.devS"
    }

    field = {
      name = "Telephone"
      phone = "+38 (111) 111 1111"
    }

    field = {
      name = "Current Date"
      date = 1556190244
    }

    field = {
      name = "Next Month and Year"
      month_year = 201905
    }

    field = {
      name = "2FA"
      totp = "otpauth://totp/label?secret=super-2fa-secret\u0026issuer=AWS"
    }
  }
}

resource "op_item_credit_card" "cc_own_card" {
  name = "CC Card Own"
  vault = "${data.op_vault.this.id}"
  notes = "My UKRSIBBANK CARD"
  tags = [
    "cc",
    "personal",
  ]

  main = {
    title = "Rewrite Main Section Name"
    cardholder = "Andrii Nasinnyk"
    type = "mc"
    ccnum = "5351 0000 0000 0000"
    cvv = "000"
    expiry = 201905
    valid_from = 201805
    field = {
      name = "extra"
      concealed = "extra"
    }
  }

  section = {
    name = "extra section"
    field = {
      name = "text"
      string = "text"
    }
  }
}