# Superminimal fax testing tool

This application will send a sample fax from one number, to a destination, using credentials specified in the `.env` file.

File sent is always [the W3 dummy test](https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf).

## Configuration variables (all mandatory)

- `SIGNALWIRE_PROJECT`: your SignalWire project ID
- `SIGNALWIRE_TOKEN`: your SignalWire token
- `SIGNALWIRE_SPACE`: your SignalWire space URL
- `FAX_FROM`: a number from your SignalWire account
- `FAX_TO`: a number or destination to send the fax to (remember to prepend `sip:` for SIP addresses)
- `BASIC_USER`: username for authentication
- `BASIC_PASS`: password for authentication