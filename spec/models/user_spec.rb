describe User do
  
  describe "#invite" do
    it "enqueues sending the invitation" do
      allow(SendNewUserInvitationJob).to receive(:perform_later)
      user = build(:user)

      user.invite

      expect(SendNewUserInvitationJob).to have_received(:perform_later)
    end
  end
end