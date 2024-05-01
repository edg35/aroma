// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
const {onRequest} = require("firebase-functions/v2/https");

// The Firebase Admin SDK to access Firestore.
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");

initializeApp();

exports.sumbitReport = onRequest(async (req, res) => {
  const smellType = req.query.smellType;
  const severity = req.query.severity;
  const description = req.query.description;

  const sumbit = await getFirestore()
      .collection("aroma-reports")
      .add({
        smellType,
        severity,
        description,
      });
  // Send back a message that we've successfully written the message
  res.json({
    id: sumbit.id,
    status: 200,
    message: "Report successfully completed",
  });
});
