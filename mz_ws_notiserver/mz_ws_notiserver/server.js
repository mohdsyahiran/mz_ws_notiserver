const express = require('express')
const { Client, LocalAuth } = require('whatsapp-web.js');
const app = express()
app.use(express.json());

// CONFIGS
const web_server_port = 8080;
const wsacc_phone_number = "60138534014"; // Enter your phone number here format: "COUNTRY_CODE""PHONE_NUMBER"
const app_key = "29d3f3c838af8b38edc528a65cda01a98e034b370701d220b3cce061b4091230" // run node app-key-generate.js to generate

const client = new Client(
    {
        authStrategy: new LocalAuth(),
        pairWithPhoneNumber: {
            phoneNumber: wsacc_phone_number
        },
        restartOnAuthFail: true,
        puppeteer: {
            headless: true,
        }
    }
);

client.on('ready', () => {
    console.log('WhatsApp Login: OK');
    console.log('Initialization completed, switched to standby mode...');

    app.post('/wsend', async (req, res) => {
        const data = req.body
        if(data.whoami == app_key){    
            res.send("Sent")
            if(
                await client.sendMessage(
                    (await client.getNumberId("6" + data.dest.replace(/\D/g,'')))._serialized,
                    data.message
                )
            )
            {
                console.log(`Sent "${JSON.stringify(data.message)}" -> ${data.dest}`)
            }
        }
        res.end()
    })
});

client.on('code', (code) => {
    console.log('WS LOGIN CODE:', code);
});

app.listen(web_server_port, () => {
    console.log(`Web server will listen to port ${web_server_port}`)
})

client.initialize();