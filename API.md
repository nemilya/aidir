# aidir API Documentation

## Base URL

http://localhost:4567/api


## Endpoints

### 1. Get All Requests
**Endpoint:** `/requests`  
**Method:** `GET`  
**Description:** Retrieves a list of all requests.

**Response:**

[
  {
    "id": "string",
    "title": "string",
    "prompt": "string",
    "files": ["string"]
  },
  ...
]


### 2. Create a New Request
**Endpoint:** `/requests`  
**Method:** `POST`  
**Description:** Creates a new request.

**Request Body:**

{
  "title": "string",
  "prompt": "string",
  "files": ["string"]
}


**Response:**

{
  "id": "string",
  "title": "string",
  "prompt": "string",
  "files": ["string"]
}


### 3. Update an Existing Request
**Endpoint:** `/requests/:id`  
**Method:** `PUT`  
**Description:** Updates the information of an existing request.

**URL Parameters:**
- `id` - the ID of the request

**Request Body:**

{
  "title": "string",
  "prompt": "string",
  "files": ["string"]
}


**Response:**

{
  "id": "string",
  "title": "string",
  "prompt": "string",
  "files": ["string"]
}


### 4. Delete a Request
**Endpoint:** `/requests/:id`  
**Method:** `DELETE`  
**Description:** Deletes the request by ID.

**URL Parameters:**
- `id` - the ID of the request

**Response:**
- **Status Code:** `204 No Content`

### 5. Get a Specific Request
**Endpoint:** `/requests/:id`  
**Method:** `GET`  
**Description:** Retrieves detailed information about a specific request by ID.

**URL Parameters:**
- `id` - the ID of the request

**Response:**

{
  "id": "string",
  "title": "string",
  "prompt": "string",
  "files": ["string"]
}


### 6. Proceed a Request
**Endpoint:** `/requests/:id/proceed`  
**Method:** `POST`  
**Description:** Sends the request for processing and retrieves the result.

**URL Parameters:**
- `id` - the ID of the request

**Response:**

{
  "result": "string"
}


---

## Usage Examples

### Example Request to Get All Requests

**Request:**

curl -X GET http://localhost:4567/api/requests


**Response:**

[
  {
    "id": "1",
    "title": "Test Request",
    "prompt": "This is a test prompt",
    "files": ["File1.txt", "File2.txt"]
  }
]


### Example Request to Create a New Request

**Request:**

curl -X POST http://localhost:4567/api/requests -H "Content-Type: application/json" -d '{
  "title": "New Request",
  "prompt": "This is a new prompt",
  "files": ["File1.txt", "File3.txt"]
}'


**Response:**

{
  "id": "2",
  "title": "New Request",
  "prompt": "This is a new prompt",
  "files": ["File1.txt", "File3.txt"]
}


### Example Request to Update a Request

**Request:**

curl -X PUT http://localhost:4567/api/requests/2 -H "Content-Type: application/json" -d '{
  "title": "Updated Request",
  "prompt": "This is an updated prompt",
  "files": ["File2.txt"]
}'


**Response:**

{
  "id": "2",
  "title": "Updated Request",
  "prompt": "This is an updated prompt",
  "files": ["File2.txt"]
}


### Example Request to Delete a Request

**Request:**

curl -X DELETE http://localhost:4567/api/requests/2


**Response:**
- **Status Code:** `204 No Content`

### Example Request to Get a Specific Request

**Request:**

curl -X GET http://localhost:4567/api/requests/1


**Response:**

{
  "id": "1",
  "title": "Test Request",
  "prompt": "This is a test prompt",
  "files": ["File1.txt", "File2.txt"]
}


### Example Request to Proceed a Request

**Request:**

curl -X POST http://localhost:4567/api/requests/1/proceed


**Response:**

{
  "result": "AI response based on the prompt: 'This is a test prompt' and selected files: File1.txt, File2.txt."
}

