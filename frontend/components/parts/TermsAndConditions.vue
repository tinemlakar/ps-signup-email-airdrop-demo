<template>
  <div class="max-w-md w-full md:px-6 my-12 mx-auto">
    <img :src="LogoPNG" class="mx-auto" width="241" height="240" alt="wallet" />

    <div class="my-8 text-center">
      <h3 class="mb-6">Terms and Conditions and Privacy Policy</h3>
      <n-scrollbar style="max-height: 400px">
        <div class="text-left">
          <p>
            We are happy to deliver information about our program to your inbox.
            In order for you to be among the first to learn about MENT news, we need your consent
            in accordance with the new legislation. MENT, which is produced by Kino Šiška,
            will use your e-mail exclusively for the purpose of informing about events that are produced or co-produced by MENT.
          </p>
          <p>
            Veseli smo, da vam lahko informacije o našem programu dostavimo v vaš e-nabiralnik.
            Da boste med prvimi izvedeli novice o MENTu, v skladu z novo zakonodajo potrebujemo vaše soglasje.
            MENT, ki ga producira Kino Šiška, bo vaš e-mail uporabljal izključno za namen obveščanja o dogodkih,
            ki nastajajo v produkciji ali koprodukciji MENTa.
          </p>
          <hr class="fullWidth my-4 border-primary-bright" />
          <p>
            I agree that MENT uses my e-mail to provide information about the program and news related to it.
          </p>
          <p>
            Strinjam se, da MENT moj e-mail uporablja za posredovanje informacij o programu in z njim povezanimi novicami.
          </p>
          <hr class="fullWidth my-4 border-primary-bright" />
          <p>
            You can change your mind at any time, change your choice, correct your contact details
            or unsubscribe completely by clicking on the link at the bottom of our email. You can also contact us via e-mail at
            <a href="mailto:info@ment.si"><u>info@ment.si</u></a>.
            We collect and use your data in accordance with the provisions of the legislation on the protection of personal data
            and with the aim of trying to show you via e-mail news that we conclude is of interest to you. Of course, we will also delete them completely at your request.
          </p>
          <p>
            Kadarkoli si lahko premislite in svojo izbiro spremenite, popravite kontaktne podatke
            ali se popolnoma odjavite tako, da kliknete na povezavo na dnu našega e-poštnega sporočila.
            Lahko se tudi obrnete na nas prek e-pošte na naslov
            <a href="mailto:info@ment.si"><u>info@ment.si</u></a>.
            Vaše podatke zbiramo in uporabljamo v skladu z določili zakonodaje o varstvu osebnih podatkov ter z namenom,
            da vam poskušamo preko e-pošte prikazati novice, za katere sklepamo, da vas zanimajo. Seveda pa jih bomo na vašo zahtevo tudi povsem izbrisali.
          </p>
        </div>
      </n-scrollbar>
    </div>
  </div>
</template>

<script setup lang="ts">
import LogoPNG from '/images/logo/MENT_Logo-01.png';
</script>
