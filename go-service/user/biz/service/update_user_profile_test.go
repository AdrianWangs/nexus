package service

import (
	"context"
	user_microservice "github.com/AdrianWangs/ai-nexus/go-service/user/kitex_gen/user_microservice"
	"testing"
)

func TestUpdateUserProfile_Run(t *testing.T) {
	ctx := context.Background()
	s := NewUpdateUserProfileService(ctx)
	// init req and assert value

	request := &user_microservice.UpdateUserRequest{}
	resp, err := s.Run(request)
	t.Logf("err: %v", err)
	t.Logf("resp: %v", resp)

	// todo: edit your unit test

}
