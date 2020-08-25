class MockData {
  static getJournals() {
    final data = [
      {
        "id": "1",
        "author": {
          "id": "1",
          "authorName": "John Smith",
          "aboutAuthor": "1",
          "address": "Maniki, Kapalong, Davao del Norte",
          "contactNumber": "09451096905",
        },
        "journal": {
          "id": "1",
          "journalTitle": "Joy and Strength",
          "journalDescription":
              "Though chosen, rescued, and promised, God’s people suffered through severe consequence for their continual rejection of Him and His covenant.",
          "journalContent":
              "Even still, God was willing to rebuild and restore His people. Gilson writes, The day God reaffirmed to them that they were still his chosen people, and he was still their God. That is a joy that could impart strength.” His love leveled them then as it humbles us now, to consider the New Testament sacrifice of God’s only Son for our own personal restoration through salvation."
        },
        "imageUrl": "assets/images/avatars/lalisa.jpeg",
      },
    ];

    return data;
  }
}
