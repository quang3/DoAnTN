package com.project.tmartweb.config.helpers;

import com.project.tmartweb.application.repositories.UserRepository;
import com.project.tmartweb.domain.entities.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.Random;
import java.util.UUID;

@Component
@RequiredArgsConstructor
public class GenerateValue {
    private final UserRepository userRepository;

    public String generateUsername(String email) {
        String userName = generateUserNameByEmail(email);
        Optional<User> user = userRepository.findByUserName(userName);
        if (user.isEmpty()) {
            return userName;
        }
        return randomUsername();
    }

    private String generateUserNameByEmail(String email) {
        return email.split("@")[0];
    }

    private static String randomUsername() {
        Random random = new Random();
        UUID uuid = UUID.randomUUID();
        String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        final int LENGTH = 8;
        StringBuilder username = new StringBuilder();
        for (int i = 0; i < LENGTH; i++) {
            username.append(characters.charAt(random.nextInt(characters.length())));
            username.append(uuid.toString().charAt(random.nextInt(uuid.toString().length())));
        }
        return username.toString();
    }
}
