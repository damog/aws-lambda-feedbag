require 'feedbag'

def find(event:, context:)

  output = {}

  if event["body"]
    begin
      output["finds"] = Feedbag.find event["body"]
      output["codeStatus"] = 200 # Fucking JSON
    rescue SocketError => e
      output["codeStatus"] = 400
      output["error"] = "SocketError"
    rescue => e
      puts e.message
      output["codeStatus"] = 400
      output["error"] = e.class.name
    end
  else
    output["codeStatus"] = 400
    output["error"] = "No data defined"
  end
  
  return {
    statusCode: output["codeStatus"],
    headers: {},
    body: JSON.generate({
      codeStatus: output["codeStatus"],
      output: output["finds"] || output["error"]
    }),
    isBase64Encoded: false
  }
end
