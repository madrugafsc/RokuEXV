# RokuEXV
The tool is written entirely in Bash, making it extremely simple, straightforward, and fast.

The "vulnerability" exploited by the tool involves the External Controller Protocol (ECP) service—typically running on port 8060 on certain smart TVs—and utilizes the core parameters of the Roku TV system.

The exploit relies on the (legitimate and legal) use of the Roku TV API, which was designed to allow direct interaction with the TV via HTTP requests.

The issue with the ECP implementation is that interacting with the API requires no prior authentication; this allows anyone connected to the same local network as a Roku TV to access and exploit the service, directly affecting the TV.

Exploiting this service is simple yet powerful, even though it does not pose a critical risk to the target device.

With this tool, you can leverage key system functions—such as launching apps, performing free-text searches, controlling volume, powering the device on or off, and navigating freely (left, right, up, down, and OK)—effectively giving you full control of the device.
